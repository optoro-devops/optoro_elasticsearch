describe 'optoro_elasticsearch::default' do
  Resources::PLATFORMS.each do |platform, value|
    value['versions'].each do |version|
      context "On #{platform} #{version}" do
        include_context 'optoro_elasticsearch'

        let(:chef_run) do
          ChefSpec::ServerRunner.new(platform: platform, version: version, log_level: :error) do |node|
            node.set['lsb']['codename'] = value['codename']
          end.converge(described_recipe)
        end

        %w(java::default
           elasticsearch::default
           elasticsearch::search_discovery
           elasticsearch::aws).each do |recipe|
          it "Includes #{recipe}" do
            expect(chef_run).to include_recipe(recipe)
          end
        end
      end
    end
  end
end
