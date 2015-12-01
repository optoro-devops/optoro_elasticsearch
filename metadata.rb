name 'optoro_elasticsearch'
maintainer 'Optoro'
maintainer_email 'devops@optoro.com'
license 'MIT'
description 'Installs ElasticSearch'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.0.22'

supports 'ubuntu', '= 14.04'

provides 'optoro_elasticsearch::client'
provides 'optoro_elasticsearch::data'
provides 'optoro_elasticsearch::default'
provides 'optoro_elasticsearch::master'

recipe 'optoro_elasticsearch::client', 'Configures a client node'
recipe 'optoro_elasticsearch::data', 'Configures a data node'
recipe 'optoro_elasticsearch::default', 'Common requirements between all node types'
recipe 'optoro_elasticsearch::master', 'Configures a master node'

depends 'apt'
depends 'build-essential'
depends 'aws'
depends 'monit', '~> 0.7.5'
depends 'java', '~> 1.31.0'

# CHEF12 fix
depends 'elasticsearch', '= 0.3.13'
