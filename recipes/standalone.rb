node.set['elasticsearch']['http_enabled'] = 'true'
node.set['elasticsearch']['node_data'] = 'true'
node.set['elasticsearch']['node_master'] = 'true'
node.set['elasticsearch']['allocated_memory'] = '256M'

include_recipe 'optoro_elasticsearch'
include_recipe 'elasticsearch::plugins'
