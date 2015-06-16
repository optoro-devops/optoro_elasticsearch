shared_context 'optoro_elasticsearch' do
  before do
    stub_command('dumpe2fs /dev/sdb').and_return(true)
    stub_command('dumpe2fs /dev/xvdf').and_return(true)
    stub_command('dumpe2fs /dev/xvdg').and_return(true)
    stub_command('dumpe2fs /dev/xvdh').and_return(true)
    stub_command('dumpe2fs /dev/xvdi').and_return(true)
    stub_command('dumpe2fs /dev/xvdj').and_return(true)
  end
end
