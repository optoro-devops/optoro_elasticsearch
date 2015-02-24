default['optoro']['ec2']['elasticsearch']['data']['devices'] = {
  '/dev/xvdf' => {
    'file_system' => 'ext4',
    'mount_options' => 'rw,user',
    'mount_path' => '/elasticsearch/disk1',
    'format_command' => 'mkfs.ext4',
    'fs_check_command' => 'dumpe2fs',
    'ebs' => {
      'device' => '/dev/sdf',
      'size' => 1000,
      'delete_on_termination' => true,
      'type' => 'gp2'
    }
  }
}
default['optoro']['default']['elasticsearch']['data']['devices'] = {
  '/dev/sdb' => {
    'file_system' => 'ext4',
    'mount_options' => 'rw,user',
    'mount_path' => '/elasticsearch/disk1',
    'format_command' => 'mkfs.ext4 -F',
    'fs_check_command' => 'dumpe2fs'
  }
}
