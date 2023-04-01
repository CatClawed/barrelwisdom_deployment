terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = ">= 2.8.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
  alias = "do"
}

data "digitalocean_ssh_key" "terraform" {
  name = var.ssh_key_name
}