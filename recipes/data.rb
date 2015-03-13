# Setting the attributes in the recipe due to a bug
# in the elasticsearch cookbook. It improperly merges
# attributes. This gets around it. Will update when a
# proper fix is found.
node.set['elasticsearch']['http_enabled'] = 'false'
node.set['elasticsearch']['node_data'] = 'true'
node.set['elasticsearch']['node_master'] = 'false'
if node['elasticsearch']['allocated_memory'].to_i > 2048
  node.set['elasticsearch']['env_options'] = '-Xmn256m -XX:SurvivorRatio=3'
end

include_recipe 'java'
include_recipe 'monit'
include_recipe 'optoro_elasticsearch::default'

# Only include ebs if running in ec2.
if node['ec2']
  # Fog dependencies
  include_recipe 'build-essential'
  chef_gem 'nokogiri' do
    version '1.6.3.1'
    action :install
  end

  node.default['elasticsearch']['data']['devices'] = node['optoro']['ec2']['elasticsearch']['data']['devices']
  include_recipe 'elasticsearch::ebs'
else
  node.default['elasticsearch']['data']['devices'] = node['optoro']['default']['elasticsearch']['data']['devices']
end
include_recipe 'elasticsearch::data'
