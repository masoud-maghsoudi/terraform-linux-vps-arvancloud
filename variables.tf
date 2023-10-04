variable "region" {
  type = string
}

variable "ApiKey" {
  type      = string
  sensitive = true
}

variable "public-key" {
  type    = string
  default = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBGaUxYCh9OHV+h/01c8JddwfSenF+Bv2JvN8Dxlo5AT3KwdeN+3wY5D5iZAY5FaOaItgoZrIQDPOAJcjBNk5kSQ="
}

variable "server-count-rocky" {
  type    = number
  default = 0
}

variable "server-count-ubuntu" {
  type    = number
  default = 0
}

variable "server-count-debian" {
  type    = number
  default = 0
}

variable "server-count-centos" {
  type    = number
  default = 0
}
