# manifests/init.pp

# Manage xfs stuff

class xfs {
    case $operatingsystem {
        centos: { include xfs::centos }
        default: { fail("no xfs module yet defined for operatingsystem ${operatingsystem}") }
    }
}

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
