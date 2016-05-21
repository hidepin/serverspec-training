require 'spec_helper'
require 'erb'

describe package('httpd'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe service('httpd'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe command('cat /etc/httpd/conf/httpd.conf') do
  servername = ENV['SERVERNAME']
  httpd_template = ERB.new(File.read('spec/template/httpd.conf.erb')).result(binding)
  its(:stdout) { should eq httpd_template }
end

describe command('rpm -qa | sort') do
  rpm_list = File.read('spec/template/rpmlist')
  its(:stdout) { should eq rpm_list }
end

describe command('chkconfig --list|sort') do
  chkconfiglist = File.read('spec/template/chkconfiglist')
  its(:stdout) { should eq chkconfiglist }
end

