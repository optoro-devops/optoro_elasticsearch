describe 'optoro_elasticsearch::test' do
  Resources::PLATFORMS.each do |platform, value|
    value['versions'].each do |version|
      context "On #{platform} #{version}" do
        include_context 'optoro_elasticsearch'

        let(:chef_run) do
          ChefSpec::ServerRunner.new(platform: platform, version: version, log_level: :error) do |node|
            node.set['lsb']['codename'] = value['codename']
          end.converge(described_recipe)
        end

        it 'Includes apt recipe' do
          expect(chef_run).to include_recipe('apt')
        end
        it 'Runs bash to set hostname' do
          expect(chef_run).to run_bash('set hostname')
        end
      end
    end
  end
end
