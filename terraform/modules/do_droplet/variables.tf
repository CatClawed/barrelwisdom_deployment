variable "do_token" {
  type      = string
  sensitive = true
}

variable "pvt_key" {
  type = string
}

variable "os_image" {
  type = string
}

variable "droplet_size" {
  type = string
}

variable "droplet_name" {
  type = string
}

variable "droplet_region" {
  type = string
}

variable "ssh_key_name" {
  type = string
}

variable "username" {
  type = string
}

variable "backups" {
  type    = bool
  default = false
}
