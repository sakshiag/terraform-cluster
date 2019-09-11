provider "ibm" {}
resource "ibm_container_cluster" "cluster" {
  name              = "${var.cluster_name}${random_id.name.hex}"
  datacenter        = "${var.datacenter}"
  no_subnet         = true
  default_pool_size = 2
  hardware          = "${var.isolation}"
  machine_type      = "${var.machine_type}"
  public_vlan_id    = "${var.public_vlan_id}"
  private_vlan_id   = "${var.private_vlan_id}"
}


data "ibm_container_cluster_config" "cluster_config" {
  cluster_name_id = "${ibm_container_cluster.cluster.id}"
}

resource "random_id" "name" {
  byte_length = 4
}
