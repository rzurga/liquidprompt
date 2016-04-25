#
# Cookbook Name:: liquidprompt
# Recipe:: default
#
# Copyright 2014, Robert Zurga (vagrant@zurga.com)
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

cookbook_file "/etc/profile.d/liquidprompt.sh" do
  owner "root"
  source "liquidprompt.sh"
  action :create_if_missing
end
