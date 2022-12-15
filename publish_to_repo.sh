#!/bin/bash

main()
{
  setup_variables

  cleanup

  let mainretval=0
  find . -name archetype -prune -o -name '*.gemspec' -print0 | while read -d $'\0' gemspecpath; do
    build "${gemspecpath}"
    let mainretval+=$?
  done

  if [[ $mainretval == 0 ]]; then
    publish_gems
    let mainretval+=$?
  fi
  if [[ $mainretval == 0 ]]; then
    cleanup
  fi
  return $mainretval
}

setup_variables()
{
  dir=$(dirname "$BASH_SOURCE")
  cd "$dir"
  root="$(pwd -P)"
  distr_dir="$root/distr"
  repository_url='https://geminabox.bryk.ai'
  sed=$(which gsed sed | head -1)
}

cleanup()
{
  rm -rf "$distr_dir"
  rm -vf */*.gem
  mkdir "$distr_dir"
  if [[ -f "./clean_jar.sh" ]]; then
    bash ./clean_jar.sh
  fi
}

build()
{
  gemspec="$1"
  echo "Building gem $gemspec"
  let retval=0
  if [[ -f "./build_jar.sh" ]]; then
    bash ./build_jar.sh
    let retval+=$?
  fi
  source_dir="$(dirname $gemspec)"
  gem_name="$(basename $gemspec)"
  pushd "$source_dir" >/dev/null
  echo "Distr: $distr_dir"
  bash "$root/gem_source/jruby" -S gem build "$gem_name"
  let retval+=$?
  mv *.gem "$distr_dir"
  let retval+=$?
  popd >/dev/null
  echo 'Done'
  return $retval
}

publish_gems()
{
  echo 'Publishing gems'
  let retval=0
  gems=("$distr_dir/$gem_name"*.gem)
  echo "Gems to install: ${gems[@]}. To url: ${repository_url}"
  for gemfile in "${gems[@]}"; do
    bash "$root/gem_source/jruby" -S gem push "$gemfile" --host "$repository_url"
    let retval+=$?
  done
  return $retval
}

main $@
