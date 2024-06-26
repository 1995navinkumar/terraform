provider "helm" {
  kubernetes {

    host = var.kubehost

    client_certificate     = base64decode(var.client_certificate)
    client_key             = base64decode(var.client_key)
    cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  }
}

provider "kubernetes" {
  host = var.kubehost

  client_certificate     = base64decode(var.client_certificate)
  client_key             = base64decode(var.client_key)
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}

# module "nginx" {
#   source = "./nginx"
# }

module "traefik" {
  source = "./traefik"
}

module "whoami" {
  source = "./whoami"
}

module "react-starter-vite" {
  source = "./react-starter-vite"
}

module "test-server" {
  source = "./test-server"
}
module "prometheus" {
  source = "./prometheus"
}

module "grafana" {
  source = "./grafana"
}

module "storage" {
  source = "./storage"
}

module "postgresql" {
  source                = "./postgresql"
  postgresAdminPassword = var.postgresAdminPassword
  postgresUser          = var.postgresUser
  postgresPassword      = var.postgresPassword
}

module "kacheri" {
  source = "./kacheri"
}

module "healthvue" {
  source = "./healthvue"
}

module "healthvue-server" {
  source = "./healthvue-server"
}