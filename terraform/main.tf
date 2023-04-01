module "digitalocean_test" {
  source         = "./modules/do_droplet"
  do_token       = var.do_token
  pvt_key        = var.pvt_key
  os_image       = var.os_image
  droplet_size   = var.droplet_size
  droplet_name   = var.droplet_name
  droplet_region = var.droplet_region
  ssh_key_name   = var.ssh_key_name
  username       = var.username
  backups        = false
}

module "cloudflare_dns_test" {
  source               = "./modules/cf_dns"
  cloudflare_api_token = var.cloudflare_api_token
  domain               = "test.barrelwisdom.com"
  droplet_ip           = module.digitalocean_test.droplet_ip
  cloudflare_zone_id   = var.cloudflare_zone_id
}
