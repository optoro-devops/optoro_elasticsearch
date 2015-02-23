include_recipe 'optoro_elasticsearch::test'
include_recipe 'build-essential'

chef_gem 'nokogiri' do
  version '1.6.3.1'
  action :install
end

include_recipe 'aws'
include_recipe 'aws::ec2_hints'
