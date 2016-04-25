#
# Cookbook Name:: liquidprompt
# Recipe:: default
#
# Copyright 2014, rzurga
#
# All rights reserved - Do Not Redistribute
#

# Set up liquidprompt
git "/opt/liquidprompt" do
  user "root"
  repository "https://github.com/nojhan/liquidprompt.git"
  revision "master"
  action :sync
end

directory "/home/vagrant/.config" do
  owner "vagrant"
  group "vagrant"
  mode 00755
  action :create
end

remote_file "/home/vagrant/.config/liquidpromptrc" do
  owner "vagrant"
  group "vagrant"
  path "/home/vagrant/.config/liquidpromptrc"
  source "file:///opt/liquidprompt/liquidpromptrc-dist"
  action :create_if_missing
end

bash "append_to_config" do
  code <<-EOF
    echo "source /opt/liquidprompt/liquidprompt" >> /home/vagrant/.bashrc
  EOF
  not_if "grep -Fxq 'liquidprompt' /home/vagrant/.bashrc"
end
