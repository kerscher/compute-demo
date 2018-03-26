variable "nomad_address" {
  description = "Address of Nomad"
  default     = "http://nomad-server.service.consul:4646"
}

variable "consul_server" {
  description = "Address of Consul server"
}

variable "consul_token" {
  description = "Token to access Consul"
}

variable "consul_kv_prefix" {
  default = "v1/kv"
}

variable "consul_kv_certs" {
  default = "secrets/certificates"
}

variable "region" {
  description = "nomad region"
  type        = "string"
}

variable "datacenters" {
  description = "nomad datacenters"
  type        = "list"
}

# Prometheus
variable "prometheus" {
  description = "parameters for prometheus module"
  type        = "map"

  default = {
    run        = true
    node_class = "manage"
  }
}

# Fabio
variable "fabio_manage_token" {
  description = "Token with ACL only to access paths created above. Must be created separately."
}

variable "fabio_compute_token" {
  description = "Token with ACL only to access paths created above. Must be created separately."
}

resource "null_resource" "vars_fabio_manage" {
  triggers = {
    run        = true
    node_class = "manage"

    ca          = "${file("fabio_manage.pem")}"
    ca_path     = "${var.consul_kv_certs}/fabio/manage/ca"
    ca_api_path = "${var.consul_server}/${var.consul_kv_prefix}/${var.consul_kv_certs}/fabio/manage/ca"

    cert          = "${file("fabio_manage.crt")}"
    cert_path     = "${var.consul_kv_certs}/fabio/manage/tls"
    cert_api_path = "${var.consul_server}/${var.consul_kv_prefix}/${var.consul_kv_certs}/fabio/manage/tls"
  }
}

resource "null_resource" "vars_fabio_compute" {
  triggers = {
    run        = true
    node_class = "compute"

    ca          = "${file("fabio_compute.pem")}"
    ca_path     = "${var.consul_kv_certs}/fabio/compute/ca"
    ca_api_path = "${var.consul_server}/${var.consul_kv_prefix}/${var.consul_kv_certs}/fabio/compute/ca"

    cert          = "${file("fabio_compute.crt")}"
    cert_path     = "${var.consul_kv_certs}/fabio/compute/tls"
    cert_api_path = "${var.consul_server}/${var.consul_kv_prefix}/${var.consul_kv_certs}/fabio/compute/tls"
  }
}

variable "grafana" {
  description = "parameters for grafana module"
  type        = "map"

  default = {
    run        = true
    node_class = "manage"
  }
}

variable "hashi-ui" {
  description = "parameters for hashi-ui module"
  type        = "map"

  default = {
    run        = true
    node_class = "manage"
  }
}

variable "ladder" {
  description = "parameters for ladder module"
  type        = "map"

  default = {
    run = true
  }
}

variable "node_exporter" {
  description = "parameters for node_exporter module"
  type        = "map"

  default = {
    run      = true
    job_name = "node_exporter"
  }
}

variable "nomad-metrics" {
  description = "parameters for nomad-metrics module"
  type        = "map"

  default = {
    run        = true
    node_class = "manage"
  }
}

variable "sysbench" {
  description = "parameters for sysbench module"
  type        = "map"

  default = {
    run = true
  }
}

variable "tls-example" {
  description = "parameters for a TLS-enabled example application"
  type        = "map"

  default = {
    run          = true
    node_class   = "compute"
    fabio_prefix = "urlprefix-compute-demo-compute-"
    domain       = "compute-demo.com"
  }
}
