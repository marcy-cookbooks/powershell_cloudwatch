actions :create, :delete
default_action :create

attribute :ps_file_path, :kind_of => String,  :required => true
attribute :interval,     :kind_of => Integer, :required => true
attribute :sample_count, :kind_of => Integer, :required => true
attribute :name_space,   :kind_of => String,  :required => true
attribute :metric_name,  :kind_of => String,  :required => true
attribute :counter_path, :kind_of => String,  :required => true