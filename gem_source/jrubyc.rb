require 'jruby/jrubyc'

status =  JRuby::Compiler::compile_argv(ARGV)

if (status != 0)
  puts "Compilation FAILED: #{status} error(s) encountered"
  exit status
end
