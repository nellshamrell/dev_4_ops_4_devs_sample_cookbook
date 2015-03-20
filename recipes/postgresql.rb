#
# Cookbook Name:: my_web_server_cookbook
# Recipe:: postgresql
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'my_web_server_cookbook::default'

package 'postgresql'

execute "create new postgres user" do
  user "postgres"
  command "psql -c \"create user deploy with password '#{insert password here}';\""
  not_if { `sudo -u postgres psql -tAc \"SELECT 1 FROM pg_roles WHERE rolname=\'deploy\'\" | wc -l`.chomp == "1" }
end

execute "create new postgres user" do
  user "postgres"
  command "psql -c \"ALTER USER deploy CREATEDB;\""
end
