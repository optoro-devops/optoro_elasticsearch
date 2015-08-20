default['java']['jdk_version'] = '7'
default['java']['openjdk_package'] = 'openjdk-7-jre-headless'

default['elasticsearch']['version'] = '1.6.0'
default['elasticsearch']['host'] = 'https://download.elastic.co'
default['elasticsearch']['jmx'] = 'true'
default['elasticsearch']['cluster']['name'] = 'UNCONFIGURED'
default['elasticsearch']['plugins'] = {
  'mobz/elasticsearch-head' => {},
  'lukas-vlcek/bigdesk' => {},
  'lmenezes/elasticsearch-kopf' => {},
  'elasticsearch/elasticsearch-cloud-aws' => { 'version' => '2.6.0' }
}
default['elasticsearch']['custom_config']['indices.memory.index_buffer_size'] = '30%'
default['elasticsearch']['custom_config']['indices.memory.min_index_buffer_size'] = '96mb'
default['elasticsearch']['custom_config']['indices.fielddata.cache.size'] = '15%'
default['elasticsearch']['custom_config']['indices.fielddata.cache.expire'] = '6h'
default['elasticsearch']['custom_config']['indices.cache.filter.size'] = '15%'
default['elasticsearch']['custom_config']['indices.cache.filter.expire'] = '6h'
default['elasticsearch']['custom_config']['index.refresh_interval'] = '30s'
default['elasticsearch']['custom_config']['index.translog.flush_threshold_ops'] = 50_000

default['elasticsearch']['limits']['nofile'] = 65_535
