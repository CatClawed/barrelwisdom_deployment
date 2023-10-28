module "digitalocean_live" {
  source         = "./modules/do_droplet"
  do_token       = var.do_token
  os_image       = var.os_image
  droplet_size   = var.droplet_size
  droplet_name   = var.droplet_name
  droplet_region = var.droplet_region
  ssh_key_name   = var.ssh_key_name
  username       = var.username
  backups        = true
  pub_key        = var.pub_key
}

module "cloudflare_dns_live" {
  source               = "./modules/cf_dns"
  cloudflare_api_token = var.cloudflare_api_token
  domain               = var.domain
  droplet_ip           = module.digitalocean_live.droplet_ip
  cloudflare_zone_id   = var.cloudflare_zone_id
}

/*
resource "null_resource" "ansible_setup" {
  depends_on = [
    module.digitalocean_live.droplet_ip
  ]
  provisioner "local-exec" {
    command = <<-EOT
      ansible-playbook --ssh-common-args='-o StrictHostKeyChecking=no' -u ${var.username} -i '${module.digitalocean_live.droplet_ip},' --private-key ${var.pvt_key} ../ansible/init.yml --extra-vars 'domain=${var.domain} user=${var.username}'
    EOT
  }
}*/

/*
module "digitalocean_test" {
  source         = "./modules/do_droplet"
  do_token       = var.do_token
  os_image       = var.os_image
  droplet_size   = var.droplet_size
  droplet_name   = "bw-test"
  droplet_region = var.droplet_region
  ssh_key_name   = var.ssh_key_name
  username       = var.username
  backups        = false
  pub_key        = var.pub_key
}

module "cloudflare_dns_test" {
  source               = "./modules/cf_dns"
  cloudflare_api_token = var.cloudflare_api_token
  domain               = "test.barrelwisdom.com"
  droplet_ip           = module.digitalocean_test.droplet_ip
  cloudflare_zone_id   = var.cloudflare_zone_id
}

resource "null_resource" "ansible_setup_test" {
  depends_on = [
    module.digitalocean_test.droplet_ip
  ]
  provisioner "local-exec" {
    command = <<-EOT
      sleep 30 && ansible-playbook --ssh-common-args='-o StrictHostKeyChecking=no' -u ${var.username} -i '${module.digitalocean_test.droplet_ip},' --private-key ${var.pvt_key} ../ansible/init.yml --extra-vars 'domain=test.barrelwisdom.com: user=${var.username}'
    EOT
  }
}*/