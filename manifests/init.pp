# Manage xfs stuff

class xfs {
    case $operatingsystem {
        centos: { include xfs::centos }
        default: { fail("no xfs module yet defined for operatingsystem ${operatingsystem}") }
    }
}
