# Setting the attributes in the recipe due to a bug
# in the elasticsearch cookbook. It improperly merges
# attributes. This gets around it. Will update when a
# proper fix is found.
node.set['elasticsearch']['http_enabled'] = 'true'
node.set['elasticsearch']['node_data'] = 'false'
node.set['elasticsearch']['node_master'] = 'true'
node.set['elasticsearch']['allocated_memory'] = '512M'
node.set['elasticsearch']['custom_config']['cluster.routing.allocation.awareness.attributes'] = 'aws_availability_zone'

include_recipe 'optoro_elasticsearch'
