variable "region" {
  type = string
}

variable "ApiKey" {
  type      = string
  sensitive = true
}


variable "image-name" {
  type    = string
  default = "debian/12" # possible choises: ["debian/10", "debian/11", "debian/12"]
}

variable "image-flavor" {
  type    = string
  default = "g2-1-1-0" # could be varied based on image-flavors provided on differenet regions
}

variable "disk_size" {
  type    = number
  default = 25
}

variable "key_name" {
  type = string
}

variable "server-count" {
  type    = number
  default = 0
}
