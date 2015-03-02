# Setting the attributes in the recipe due to a bug
# in the elasticsearch cookbook. It improperly merges
# attributes. This gets around it. Will update when a
# proper fix is found.
node.set['elasticsearch']['http_enabled'] = 'false'
node.set['elasticsearch']['node_data'] = 'false'
node.set['elasticsearch']['node_master'] = 'true'
node.set['elasticsearch']['allocated_memory'] = '512M'

include_recipe 'optoro_elasticsearch'
