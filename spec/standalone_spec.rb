describe 'optoro_elasticsearch::standalone' do
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
           elasticsearch::plugins).each do |recipe|
          it "Includes #{recipe}" do
            expect(chef_run).to include_recipe(recipe)
          end
        end

        it 'Creates standalone config for elasticsearch' do
          expect(chef_run).to render_file('/usr/local/etc/elasticsearch/elasticsearch.yml')
            .with_content('cluster.name: UNCONFIGURED')
          expect(chef_run).to render_file('/usr/local/etc/elasticsearch/elasticsearch.yml')
            .with_content('http.enabled: true')
          expect(chef_run).to render_file('/usr/local/etc/elasticsearch/elasticsearch.yml')
            .with_content('node.data: true')
          expect(chef_run).to render_file('/usr/local/etc/elasticsearch/elasticsearch.yml')
            .with_content('node.master: true')
          expect(chef_run).to render_file('/usr/local/etc/elasticsearch/elasticsearch-env.sh')
            .with_content('ES_HEAP_SIZE=256M')
        end
      end
    end
  end
end
