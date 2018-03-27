job "${job_name}" {
  region      = "${region}"
  datacenters = ["${datacenters}"]
  type        = "service"

  group "tls-example" {
    task "nginx" {
      driver = "docker"

      config {
        image = "nginx"

        port_map {
          http = 80
        }
      }

      resources {
        cpu    = ${cpu_limit}
        memory = ${mem_limit}

        network {
          mbits = ${net_limit}
          port "http" {}
        }
      }

      service {
        name = "nginx-${job_name}"
        port = "http"
        
        tags = [
          "${fabio_prefix}-${domain}/ proto=https tlsskipverify=true",
          "${fabio_prefix}-${domain}/",
          "${fabio_prefix}-/"
        ]

        check {
          name     = "nginx-${job_name}"
          type     = "tcp"
          interval = "9s"
          timeout  = "3s"
        }
      }
    }
  }
}
