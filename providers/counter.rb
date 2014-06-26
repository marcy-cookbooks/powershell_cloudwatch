action :create do
  template new_resource.ps_file_path do
    source "counter.ps1.erb"
    owner "Administrator"
    group "Administrator"
    action :create
  end
  windows_scheduler_job new_resource.name do
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