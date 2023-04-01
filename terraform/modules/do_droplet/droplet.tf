
resource "digitalocean_droplet" "this" {
  image   = var.os_image
  name    = var.droplet_name
  region  = var.droplet_region
  size    = var.droplet_size
  backups = var.backups
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
  user_data = file("./user-data.yml")

  connection {
    host        = self.ipv4_address
    user        = var.username
    type        = "ssh"
    private_key = file(var.pvt_key)
    timeout     = "2m"
  }
}

output "droplet_ip" {
  value = digitalocean_droplet.this.ipv4_address
}
