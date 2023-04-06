
resource "digitalocean_droplet" "this" {
  image   = var.os_image
  name    = var.droplet_name
  region  = var.droplet_region
  size    = var.droplet_size
  backups = var.backups
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
  user_data = templatefile("${path.module}/user-data.tftpl", { user = var.username, pub_key = var.pub_key })
}

output "droplet_ip" {
  value = digitalocean_droplet.this.ipv4_address
}
