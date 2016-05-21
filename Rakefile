require 'rake'
require 'rspec/core/rake_task'

targets = %w(
  127.0.0.1
)

task :spec    => 'spec:all'
task :default => :spec

namespace :spec do
  task :all     => targets
  task :default => :all

  targets.each do |target|
    desc "Run serverspec tests to #{target}"

    RSpec::Core::RakeTask.new(target.to_sym) do |t|
      ENV['TARGET_HOST'] = target
      t.pattern = "spec/default/*_spec.rb"
      t.fail_on_error = false
    end
  end
end
