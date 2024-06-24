resource "libvirt_volume" "opensuse_leap" {
  name   = "opensuse_leap"
  source = "http://download.opensuse.org/repositories/Cloud:/Images:/Leap_42.1/images/openSUSE-Leap-42.1-OpenStack.x86_64.qcow2"
}

# volume to attach to the "master" domain as main disk
resource "libvirt_volume" "master" {
  name           = "master.qcow2"
  base_volume_id = libvirt_volume.opensuse_leap.id
}

# volumes to attach to the "workers" domains as main disk
resource "libvirt_volume" "worker" {
  name           = "worker_${count.index}.qcow2"
  base_volume_id = libvirt_volume.opensuse_leap.id
  count          = 1
}
