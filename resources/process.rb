actions :create, :delete
default_action :create

attribute :ps_file_path, :kind_of => String,  :required => true
attribute :process_name, :kind_of => String,  :required => true
attribute :span_minutes, :kind_of => Integer, :required => true
attribute :name_space,   :kind_of => String,  :required => true
attribute :metric_name,  :kind_of => String,  :required => true