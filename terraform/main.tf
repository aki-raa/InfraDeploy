terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "infradeploy_net" {
  name = "infradeploy-net"
}

resource "docker_container" "app" {
  name  = "infradeploy-app"
  image = "infradeploy-app"

  networks_advanced {
    name = docker_network.infradeploy_net.name
  }

  command = ["sleep", "infinity"]
}

resource "docker_container" "app_1" {
  name  = "infradeploy-app-1"
  image = "infradeploy-app"

  networks_advanced {
    name = docker_network.infradeploy_net.name
  }

  command = ["sleep", "infinity"]
}
