variable "do_token" {
  type      = string
  sensitive = true
}

variable "pvt_key" {
  type = string
}

variable "pub_key" {
  type = string
  sensitive = true
}

variable "os_image" {
  type    = string
  default = "debian-11-x64"
}

variable "droplet_size" {
  type    = string
  default = "s-1vcpu-1gb"
}

variable "droplet_name" {
  type    = string
  default = "test"
}

variable "droplet_region" {
  type    = string
  default = "nyc3"
}

variable "ssh_key_name" {
  type = string
}

variable "domain" {
  type    = string
  default = "test.barrelwisdom.com"
}

variable "username" {
  type = string
}

variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

variable "cloudflare_zone_id" {
  type      = string
  sensitive = true
}
