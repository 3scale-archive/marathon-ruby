require 'bundler/gem_tasks'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)

  task default: :spec
rescue LoadError
  # no rspec available (like production env)
  warn 'no rspec available'
end
