# Setting the attributes in the recipe due to a bug
# in the elasticsearch cookbook. It improperly merges
# attributes. This gets around it. Will update when a
# proper fix is found.
node.set['elasticsearch']['http_enabled'] = 'true'
node.set['elasticsearch']['node_data'] = 'false'
node.set['elasticsearch']['node_master'] = 'false'
node.set['elasticsearch']['allocated_memory'] = '256M'

include_recipe 'optoro_elasticsearch'
include_recipe 'elasticsearch::plugins'
