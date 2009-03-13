define apache2::site($ensure) {

    case $ensure {
        present: {
            exec { "enable $name":
                    command => "/usr/sbin/a2ensite $name",
                    unless => "/bin/ls /etc/apache2/sites-enabled | grep '$name'",
                    notify => Service['apache2']
                 }
        }
        absent: {
            exec { "disable $name":
                    command => "/usr/sbin/a2dissite $name",
                    onlyif => "/bin/ls /etc/apache2/sites-enabled | grep '$name'",
                    notify => Service['apache2']
            }
        }
        default: {
            fail "Invalid 'ensure' value '$ensure' for apach2::vhost"
        }
    }
}
