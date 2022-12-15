dir=$(dirname "$BASH_SOURCE")
sort=$(which gsort sort | head -1)
sed=$(which gsed sed | head -1)

if [[ -r "$dir/project_parameters.sh" ]]; then
  . "$dir/project_parameters.sh"
fi
if [[ -r ./project_parameters.sh ]]; then
  . ./project_parameters.sh
fi
if [[ -r "/var/local/config/${application_name}_jvm.sh" ]]; then
  . "/var/local/config/${application_name}_jvm.sh"
fi

javac=$(find 2>/dev/null /usr/lib/jvm/java-7* /usr/lib/jvm/jdk1.7* /Library/Java/JavaVirtualMachines/jdk1.7*/Contents/Home -type f -name javac | $sort -Vr | head -1)
java=$(find 2>/dev/null /usr/lib/jvm/java-7* /usr/lib/jvm/jdk1.7* /Library/Java/JavaVirtualMachines/jdk1.7*/Contents/Home -type f -name java | $sort -Vr | head -1)

if [[ "$java_major_version" == '8' || -z "$java" ]]; then
  javac=$(find 2>/dev/null /usr/lib/jvm/java-8* /usr/lib/jvm/jdk1.8* /usr/lib/jvm/java-1.8* /Library/Java/JavaVirtualMachines/adoptopenjdk-8*/Contents/Home /Library/Java/JavaVirtualMachines/jdk1.8*/Contents/Home -type f -name javac | $sort -Vr | head -1)
  java=$(find 2>/dev/null /usr/lib/jvm/java-8* /usr/lib/jvm/jdk1.8* /usr/lib/jvm/java-1.8* /Library/Java/JavaVirtualMachines/adoptopenjdk-8*/Contents/Home /Library/Java/JavaVirtualMachines/jdk1.8*/Contents/Home -type f -name java | $sort -Vr | head -1)
fi

if [[ "$java_major_version" == '11' || -z "$java" ]]; then
  javac=$(find 2>/dev/null /usr/lib/jvm/java-11* /usr/lib/jvm/jdk-11* /Library/Java/JavaVirtualMachines/adoptopenjdk-11*/Contents/Home /Library/Java/JavaVirtualMachines/jdk-11*/Contents/Home -type f -name javac | $sort -Vr | head -1)
  java=$(find 2>/dev/null /usr/lib/jvm/java-11* /usr/lib/jvm/jdk-11* /Library/Java/JavaVirtualMachines/adoptopenjdk-11*/Contents/Home /Library/Java/JavaVirtualMachines/jdk-11*/Contents/Home -type f -name java | $sort -Vr | head -1)
fi

if [[ -n "$java" ]]; then
  java_bin=$(dirname "$java")
  jre_home=$(dirname "$java_bin")
  export JAVA_HOME="$jre_home"
  export PATH="$java_bin:$PATH"
else
  if [[ -n "$java_major_version" ]]; then
    echo "Java version $java_major_version not found. System java will be used"
  else
    echo "No java version specified or requested java version not found. System java will be used"
  fi
fi
if [[ -n "$javac" ]]; then
  jdk_bin=$(dirname "$javac")
  export JDK_HOME=$(dirname "$jdk_bin")
  export PATH="$jdk_bin:$PATH"
fi

java_version=$(java -version 2>&1 | head -1 | $sed 's/.*"\(.\+\)".*/\1/')
jvm_mem_primary="${jvm_mem_primary:--Xmx512m -Xmn128m}"
if [[ "$java_version" > "1.8" ]]; then
  jvm_mem_secondary="${jvm_mem_secondary:--Xss2m -XX:+UseCodeCacheFlushing}"
  jvm_mem="$(echo "$jvm_mem_primary $jvm_mem_secondary" | $sed 's/\s*\S\+PermSize=\S\+//g')"
  jvm_bgproc="${jvm_bgproc:--Xmx512m -Xms512m -XX:+PrintFlagsFinal}"
else
  jvm_mem_secondary="${jvm_mem_secondary:--XX:MaxPermSize=256m -Xss2m -XX:+UseCodeCacheFlushing}"
  jvm_mem="$jvm_mem_primary $jvm_mem_secondary"
  jvm_bgproc="${jvm_bgproc:--Xmx512m -Xms512m -XX:+PrintFlagsFinal}"
fi

jvm_jit="${jvm_jit:--Djruby.jit.threshold=10 -Djruby.jit.max=-1 -XX:+TieredCompilation -XX:ReservedCodeCacheSize=256m}"
jvm_gc="${jvm_gc:--XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:CMSInitiatingOccupancyFraction=70}"
jvm_runtime="${jvm_runtime:--Djava.awt.headless=true -Dfile.encoding=UTF-8}"
jvm_log="${jvm_log:--XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCDateStamps -XX:+PrintFlagsFinal}"
jvm_timezone="${jvm_timezone:--Duser.timezone=Australia/Melbourne}"

jvm_opts="-Djruby.bindir=. -Djruby.launch.inproc=true -Djruby.cli.version=true $jvm_mem $jvm_jit $jvm_gc $jvm_runtime $jvm_timezone $jvm_extra"

# We add the bindir directive here to stop any gem executables from rvm or rbenv being used.
# Using -Djruby.launch.inproc=true but outputs an error, though nothing seems to break.
if [[ "$JVM_LOG" == 'true' ]]; then
  jvm_opts="$jvm_log $jvm_opts"
fi

jvm_opts_jetty="$jvm_opts $jvm_jetty"
jvm_opts_bgproc="$jvm_opts $jvm_bgproc"
jvm_opts_specs="$jvm_opts $jvm_specs"
case $jvm_usage in
  specs)
    jvm_opts="$jvm_opts_specs"
    ;;
esac
