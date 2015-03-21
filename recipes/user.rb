#
# Cookbook Name:: my_web_server_cookbook
# Recipe:: user
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'my_web_server_cookbook::deploy_user'

execute 'create .ssh directory' do
  command "sudo mkdir /home/deploy/.ssh"
  action :run
  not_if { ::File.exists?("/home/deploy/.ssh")}
end

template '/home/deploy/.ssh/authorized_keys' do
  source 'ssh_key.erb'
end
