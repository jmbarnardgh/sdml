require 'test/unit'
require 'rake/testtask'
require 'require_all'
require_rel '../../../../tests/tokenization'

task default: 'test'
Rake::TestTask.new do |task|
    task.pattern = '../../../../tests/**/test_*.rb'
    task.verbose = true
end