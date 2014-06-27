action :create do
  template new_resource.ps_file_path do
    source "counter.ps1.erb"
    variables({
     :aws_access_key => node[:powershell_cloudwatch][:aws_access_key],
     :aws_secret_key => node[:powershell_cloudwatch][:aws_secret_key],
     :region => node[:powershell_cloudwatch][:region],
     :profile_name => node[:powershell_cloudwatch][:profile_name],
     :is_ec2 => node[:powershell_cloudwatch][:is_ec2],
     :counter_path => new_resource.counter_path,
     :interval => new_resource.interval,
     :sample_count => new_resource.sample_count,
     :metric_name => new_resource.metric_name,
     :name_space => new_resource.name_space,
     :value_calculate => new_resource.value_calculate
    })
    action :create
    cookbook 'powershell_cloudwatch'
  end
  windows_scheduler_job "Counter_#{new_resource.name}" do
    script_path new_resource.ps_file_path
    span_minutes new_resource.interval * new_resource.sample_count / 60
    action :create
  end
end

action :delete do
  template new_resource.ps_file_path do
    action :delete
  end
  windows_scheduler_job new_resource.name do
    action :delete
  end
end