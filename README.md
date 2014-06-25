powershell_cloudwatch Cookbook
==============================
Put metric to Amazon CloudWatch that use AWS Toolkit for Windows PowerShell.

Requirements
------------
* Chef 11 or higher
* Windows Server 2008 R2 or later
* PowerShell 3.0 or higher

Attributes
----------

#### powershell_cloudwatch::default
```ruby
default[:powershell_cloudwatch][:aws_access_key] = ""
default[:powershell_cloudwatch][:aws_secret_key] = ""
default[:powershell_cloudwatch][:region]         = "ap-northeast-1"
default[:powershell_cloudwatch][:profile_name]   = "PutMetricToCloudWatch"
default[:powershell_cloudwatch][:is_ec2]         = true
```

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['powershell_cloudwatch']['aws_access_key']</tt></td>
    <td>String</td>
    <td>AWS Access Key</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['powershell_cloudwatch']['aws_secret_key']</tt></td>
    <td>String</td>
    <td>AWS Secret Access Key</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['powershell_cloudwatch']['region']</tt></td>
    <td>String</td>
    <td>AWS Region</td>
    <td><tt>ap-northeast-1</tt></td>
  </tr>
  <tr>
    <td><tt>['powershell_cloudwatch']['profile_name']</tt></td>
    <td>String</td>
    <td>Credential profile name for AWS Toolkit for Powershell</td>
    <td><tt>ap-northeast-1</tt></td>
  </tr>
  <tr>
    <td><tt>['powershell_cloudwatch']['profile_name']</tt></td>
    <td>String</td>
    <td>Credential profile name for AWS Toolkit for Powershell</td>
    <td><tt>PutMetricToCloudWatch</tt></td>
  </tr>
  <tr>
    <td><tt>['powershell_cloudwatch']['is_ec2']</tt></td>
    <td>Boolean</td>
    <td>Is your instance in AWS EC2?</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### powershell_cloudwatch::default
TODO: Write usage instructions for each cookbook.

##### 1. Just include `powershell_cloudwatch` in your node's `run_list` or include your cookbook:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[powershell_cloudwatch]"
  ]
}
```
or
```ruby
include_recipe "powershell_cloudwatch"
```

##### 2. Just include `powershell_cloudwatch` in your cookbook's `metadata.rb`:
```ruby
depends 'powershell_cloudwatch'
```

##### 3. Create recipe that use `powershell_cloudwatch_counter` resource like this:
```ruby
  powershell_cloudwatch_counter "CW_CPU" do
    ps_file_path "C:¥cw_cpu.ps1"
    interval 5
    sample_count 60
    name_space "System/Windows"
    metric_name "CPUUtilization"
    counter_path "¥Processor(_Total)¥% Processor Time"
  end
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
* License: Apache 2.0
* Author: Masashi Terui