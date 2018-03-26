resource "consul_keys" "fabio-manage" {
  datacenter = "${var.datacenters}"
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
  datacenter = "${var.datacenters}"
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
