variable "job_name" {
  description = "globally unique name for this job"
  type        = "string"
  default     = "tls-example"
}

variable "region" {
  description = "nomad region"
  type        = "string"
}

variable "datacenters" {
  description = "nomad datacenters"
  type        = "list"
}

variable "node_class" {
  description = "nomad node class that should run this job"
  type        = "string"
}

variable "run" {
  description = "boolean, to run or not to run"
  default     = "true"
}

variable "cpu_limit" {
  description = "CPU resource limit"
  default     = "250"
}

variable "mem_limit" {
  description = "Memory resource limit"
  default     = "160"
}

variable "net_limit" {
  description = "Network resource limit"
  default     = "3"
}

variable "fabio_prefix" {
  description = "maps to fabio's registry.consul.tagprefix"
  type        = "string"
}

variable "domain" {
  description = "domain to register for fabio routes"
  type        = "string"
}