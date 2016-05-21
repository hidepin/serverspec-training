require 'rake'
require 'rspec/core/rake_task'
require 'yaml'

properties = YAML.load_file('properties.yml')

task :spec    => 'spec:all'
task :default => :spec

namespace :spec do
  task :all     => properties.keys.map
  task :default => :all

  properties.keys.each do |target|
    desc "Run serverspec tests to #{target}"

    RSpec::Core::RakeTask.new(target.to_sym) do |t|
      ENV['TARGET_HOST'] = properties[target][:ip]
      ENV['SERVERNAME'] = properties[target][:servername]
      t.pattern = "spec/default/*_spec.rb"
      t.fail_on_error = false
    end
  end
end
