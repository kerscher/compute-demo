resource "consul_keys" "fabio-manage" {
  count      = "${length(var.consul_datacenters)}"
  datacenter = "${element(var.consul_datacenters, count.index)}"

  key {
    path  = "${null_resource.vars_fabio_manage.triggers.ca_path}"
    value = "${null_resource.vars_fabio_manage.triggers.ca}"
  }

  key {
    path  = "${null_resource.vars_fabio_manage.triggers.cert_path}"
    value = "${null_resource.vars_fabio_manage.triggers.cert}"
  }
}

resource "consul_keys" "fabio-compute" {
  count      = "${length(var.consul_datacenters)}"
  datacenter = "${element(var.consul_datacenters, count.index)}"

  key {
    path  = "${null_resource.vars_fabio_compute.triggers.ca_path}"
    value = "${null_resource.vars_fabio_compute.triggers.ca}"
  }

  key {
    path  = "${null_resource.vars_fabio_compute.triggers.cert_path}"
    value = "${null_resource.vars_fabio_compute.triggers.cert}"
  }
}
