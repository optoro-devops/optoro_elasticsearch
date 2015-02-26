default['java']['jdk_version'] = '7'
default['java']['openjdk_package'] = 'openjdk-7-jre-headless'

default['elasticsearch']['version'] = '1.4.4'
default['elasticsearch']['jmx'] = 'true'
default['elasticsearch']['cluster']['name'] = 'UNCONFIGURED'
default['elasticsearch']['plugins'] = {
  'mobz/elasticsearch-head' => {},
  'lukas-vlcek/bigdesk' => {},
  'lmenezes/elasticsearch-kopf' => {}
}
