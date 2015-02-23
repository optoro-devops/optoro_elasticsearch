describe 'optoro_elasticsearch::data' do
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
           monit::default
           elasticsearch::default
           elasticsearch::monit
           elasticsearch::search_discovery
           elasticsearch::data).each do |recipe|
          it "Includes #{recipe}" do
            expect(chef_run).to include_recipe(recipe)
          end
        end

        it 'Includes elasticsearch::ebs if in ec2' do
          chef_run.node.automatic['ec2'] = true
          chef_run.converge(described_recipe)

          expect(chef_run).to include_recipe('elasticsearch::ebs')
        end

        it 'Creates data config for elasticsearch' do
          expect(chef_run).to render_file('/usr/local/etc/elasticsearch/elasticsearch.yml').with_content('cluster.name: UNCONFIGURED')
          expect(chef_run).to render_file('/usr/local/etc/elasticsearch/elasticsearch.yml').with_content('http.enabled: false')
          expect(chef_run).to render_file('/usr/local/etc/elasticsearch/elasticsearch.yml').with_content('node.data: true')
          expect(chef_run).to render_file('/usr/local/etc/elasticsearch/elasticsearch.yml').with_content('node.master: false')
        end
      end
    end
  end
end
