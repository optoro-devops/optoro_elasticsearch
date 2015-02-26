require 'spec_helper'

describe 'optoro_elasticsearch::client' do
  describe process('java') do
    it { should be_running }
  end

  describe service('elasticsearch') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(9200) do
    it { should be_listening }
  end

  describe command('curl -XGET http://localhost:9200') do
    its(:stdout) { should match '"tagline" : "You Know, for Search"' }
  end

  %w(bigdesk
     head
     kopf).each do |plugin|
    describe file("/usr/local/elasticsearch/plugins/#{plugin}") do
      it { should be_directory }
    end
  end
end
