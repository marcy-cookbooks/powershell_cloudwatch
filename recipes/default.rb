powershell_cloudwatch_counter "CW_CPU" do
  ps_file_path "C:¥cw_cpu.ps1"
  interval 5
  sample_count 60
  name_space "System/Windows"
  metric_name "CPUUtilization"
  counter_path "¥Processor(_Total)¥% Processor Time"
end

powershell_cloudwatch_counter "CW_Memory" do
  ps_file_path "C:¥cw_memory.ps1"
  interval 5
  sample_count 60
  name_space "System/Windows"
  metric_name "UsedMemoryPercent"
  counter_path "¥Memory¥% committed bytes in use"
end

powershell_cloudwatch_counter "CW_Disk" do
  ps_file_path "C:¥cw_memory.ps1"
  interval 5
  sample_count 60
  name_space "System/Windows"
  metric_name "UsedMemoryPercent"
  counter_path "¥LogicalDisk(_total)¥% Free Space"
end