GENTOO_SESSION =
  COMMON_SESSION.merge( 
                { 
                  :boot_cmd_sequence =>
                   [
                      '<Wait>' * 2,
                      'gentoo-nofb<Enter>',
                      '<Wait>' * 10,
                      '<Enter>',
                      '<Wait>' * 12,
                      '<Wait><Wait>ifconfig -a<Enter>',
                      'passwd<Enter><Wait><Wait>',
                      'vagrant<Enter><Wait>',
                      'vagrant<Enter><Wait>',
                      '/etc/init.d/sshd start<Enter>'
                   ],
                   :postinstall_files => 
                   [     
                      "settings.sh",
                      "architecture_settings.sh",
                      'base.sh',
                      'kernel.sh',
                      'virtualbox.sh',
                      'vagrant.sh',
                      'cron.sh',
                      'syslog.sh',
                      'nfs.sh',
                      'grub.sh',
                      'reboot.sh',
                      'rubysource-chef-puppet.sh',
                      'cleanup.sh',
                      'zerodisk.sh'                        
                    ],
                   :kickstart_file => '',
                   :shutdown_cmd => "/sbin/shutdown -h now",
                   :postinstall_timeout => "10000" 
                }
  )
