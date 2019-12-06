variable "name" {
  description = "iam user name"
}

variable "actions" {
  type    = "list"
  default = []
}

variable "resources" {
  type    = "list"
  default = []
}
