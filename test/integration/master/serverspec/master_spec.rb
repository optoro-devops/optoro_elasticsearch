require 'spec_helper'

describe 'optoro_elasticsearch::master' do
  describe process('java') do
    it { should be_running }
  end

  describe service('elasticsearch') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(9300) do
    it { should be_listening }
  end
end
