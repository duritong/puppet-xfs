class xfs::centos {
    package{'xfsprogs':
        ensure => present,
    }

    case $virtual {
        xen0: {
            package{'kmod-xfs-xen':
                ensure => present,
            }
        }
        default: {
            package{'kmod-xfs':
                ensure => present,
            }
        }
    }
}
