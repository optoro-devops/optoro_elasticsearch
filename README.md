# Description

Installs ElasticSearch

# Requirements

## Platform:

* Ubuntu (= 14.04)

## Cookbooks:

* apt
* build-essential
* aws
* monit (~> 0.7.5)
* java (~> 1.31.0)
* elasticsearch (~> 0.3.13)
* optoro_metrics

# Attributes

* `node['optoro']['ec2']['elasticsearch']['data']['devices']` -  Defaults to `{ ... }`.
* `node['optoro']['default']['elasticsearch']['data']['devices']` -  Defaults to `{ ... }`.
* `node['elasticsearch']['path']['data']` -  Defaults to `[ ... ]`.
* `node['java']['jdk_version']` -  Defaults to `7`.
* `node['java']['openjdk_package']` -  Defaults to `openjdk-7-jre-headless`.
* `node['elasticsearch']['version']` -  Defaults to `1.4.4`.
* `node['elasticsearch']['jmx']` -  Defaults to `true`.
* `node['elasticsearch']['cluster']['name']` -  Defaults to `UNCONFIGURED`.
* `node['elasticsearch']['plugins']` -  Defaults to `{ ... }`.
* `node['elasticsearch']['custom_config']['indices.memory.index_buffer_size']` -  Defaults to `30%`.
* `node['elasticsearch']['custom_config']['indices.memory.min_index_buffer_size']` -  Defaults to `96mb`.
* `node['elasticsearch']['custom_config']['indices.fielddata.cache.size']` -  Defaults to `15%`.
* `node['elasticsearch']['custom_config']['indices.fielddata.cache.expire']` -  Defaults to `6h`.
* `node['elasticsearch']['custom_config']['indices.cache.filter.size']` -  Defaults to `15%`.
* `node['elasticsearch']['custom_config']['indices.cache.filter.expire']` -  Defaults to `6h`.
* `node['elasticsearch']['custom_config']['index.refresh_interval']` -  Defaults to `30s`.
* `node['elasticsearch']['custom_config']['index.translog.flush_threshold_ops']` -  Defaults to `50_000`.

# Recipes

* optoro_elasticsearch::client - Configures a client node
* optoro_elasticsearch::data - Configures a data node
* optoro_elasticsearch::default - Common requirements between all node types
* optoro_elasticsearch::master - Configures a master node

# License and Maintainer

Maintainer:: Optoro (<devops@optoro.com>)

License:: MIT
