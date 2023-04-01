variable "cloudflare_api_token" {
  type = string
  sensitive = true
}

variable "domain" {
  type = string
  default = "test.barrelwisdom.com"
}

variable "droplet_ip" {
  type = string
}

variable "cloudflare_zone_id" {
  type = string
  sensitive = true
}