resource "cloudflare_record" "domain" {
  zone_id = var.cloudflare_zone_id
  name    = var.domain
  value   = var.droplet_ip
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "www" {
  zone_id = var.cloudflare_zone_id
  name    = "www"
  value   = var.droplet_ip
  type    = "A"
  proxied = true
}