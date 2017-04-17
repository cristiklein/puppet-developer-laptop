# Mount /tmp on tmpfs
# /tmp is generally not mounted on tmpfs and will incur IO overhead for tmp operations (damaging your SSD if you have one).
# Most laptop computers have enough memory to benefit from this
class base::tmp_on_tmpfs {
  
  mount { '/tmp' :
    ensure      => 'mounted',
    atboot      => true,
    device      => 'tmpfs',
    fstype      => 'tmpfs',
    options     => 'defaults,noatime,size=25%,mode=1777'
  }
}
