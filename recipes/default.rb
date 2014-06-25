#
# Cookbook Name:: powershell_cloudwatch
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "C:¥AWSToolsAndSDKForNet.msi" do
  source "http://sdk-for-net.amazonwebservices.com/latest/AWSToolsAndSDKForNet.msi"
end

powershell_script "import-module AWSPowerShell" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
  import-module "C:¥Program Files (x86)¥AWS Tools¥PowerShell¥AWSPowerShell¥AWSPowerShell.psd1"
  EOH
  action :nothing
end

windows_package "AWS Toolkit for PowerShell" do
  action :install
  source "C:¥AWSToolsAndSDKForNet.msi"
  notifies :run, "powershell_script[import-module AWSPowerShell]"
end