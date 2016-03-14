require 'spec_helper'

describe 'optoro_elasticsearch::data' do
  # Give ES time to come up
  sleep(60)

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

  describe port(9300) do
    it { should be_listening }
  end

  # %w(disk2 disk3 disk4 disk5).each do |disk|
  #   describe file("/elasticsearch/#{disk}") do
  #     it { should be_directory }
  #     it { should be_mode 755 }
  #     it { should be_owned_by 'elasticsearch' }
  #     it { should be_grouped_into 'elasticsearch' }
  #     it do
  #       should be_mounted.with(:type => 'ext4',
  #                              :options => {
  #                                :rw => true })
  #     end
  #   end
  # end
end
