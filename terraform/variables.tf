variable "boxImage" {
    default = "https://app.vagrantup.com/generic/boxes/ubuntu2004/versions/4.3.12/providers/virtualbox/amd64/vagrant.box"
}

variable "controlplane_memory" {
    default = 5120
}

variable "controlplane_cpus" {
    default = 2
}

variable "worker_memory" {
    default = 4096
}

variable "worker_cpus" {
    default = 2
}