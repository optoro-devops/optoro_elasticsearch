require 'spec_helper'

# Give elasticsearch time to come up
# JAVA!!!
sleep(60)

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
end
