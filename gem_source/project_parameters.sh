jruby_version=${jruby_version:-9.2.17.0}
java_major_version=${java_major_version:-11}
bundler_version=2.2.17

if [[ "$jruby_version" < "2.0" ]]; then
  ruby_abi_version=1.9
elif [[ "$jruby_version" < "9.2.0.0" ]]; then
  ruby_abi_version=2.3.0
else
  ruby_abi_version=2.5.0
fi
