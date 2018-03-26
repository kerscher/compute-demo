resource "consul_keys" "fabio-manage" {
  count = "${length(var.datacenters)}"

  datacenter = "${element(var.datacenters, count.index)}"
  token      = "${null_resource.vars_fabio_manage.triggers.consul_token}"

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
  count = "${length(var.datacenters)}"

  datacenter = "${element(var.datacenters, count.index)}"
  token      = "${null_resource.vars_fabio_compute.triggers.consul_token}"

  key {
    path  = "${null_resource.vars_fabio_compute.triggers.ca_path}"
    value = "${null_resource.vars_fabio_compute.triggers.ca}"
  }

  key {
    path  = "${null_resource.vars_fabio_compute.triggers.cert_path}"
    value = "${null_resource.vars_fabio_compute.triggers.cert}"
  }
}
