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
  },
  '/dev/xvdg' => {
    'file_system' => 'ext4',
    'mount_options' => 'rw,user',
    'mount_path' => '/elasticsearch/disk2',
    'format_command' => 'mkfs.ext4',
    'fs_check_command' => 'dumpe2fs',
    'ebs' => {
      'device' => '/dev/sdg',
      'size' => 250,
      'delete_on_termination' => true,
      'type' => 'gp2'
    }
  },
  '/dev/xvdh' => {
    'file_system' => 'ext4',
    'mount_options' => 'rw,user',
    'mount_path' => '/elasticsearch/disk3',
    'format_command' => 'mkfs.ext4',
    'fs_check_command' => 'dumpe2fs',
    'ebs' => {
      'device' => '/dev/sdh',
      'size' => 250,
      'delete_on_termination' => true,
      'type' => 'gp2'
    }
  },
  '/dev/xvdi' => {
    'file_system' => 'ext4',
    'mount_options' => 'rw,user',
    'mount_path' => '/elasticsearch/disk4',
    'format_command' => 'mkfs.ext4',
    'fs_check_command' => 'dumpe2fs',
    'ebs' => {
      'device' => '/dev/sdi',
      'size' => 250,
      'delete_on_termination' => true,
      'type' => 'gp2'
    }
  },
  '/dev/xvdj' => {
    'file_system' => 'ext4',
    'mount_options' => 'rw,user',
    'mount_path' => '/elasticsearch/disk5',
    'format_command' => 'mkfs.ext4',
    'fs_check_command' => 'dumpe2fs',
    'ebs' => {
      'device' => '/dev/sdj',
      'size' => 250,
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
default['elasticsearch']['path']['data'] = [
  '/elasticsearch/disk2',
  '/elasticsearch/disk3',
  '/elasticsearch/disk4',
  '/elasticsearch/disk5'
]
