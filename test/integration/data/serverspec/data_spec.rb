require 'spec_helper'

# Give elasticsearch time to come up
# JAVA!!!
sleep(60)

describe 'optoro_elasticsearch::data' do
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

  describe file('/elasticsearch/disk1') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'elasticsearch' }
    it { should be_grouped_into 'elasticsearch' }
    it do
      should be_mounted.with(:type => 'ext4',
                             :options => {
                               :rw => true
                             }
      )
    end
  end
end
