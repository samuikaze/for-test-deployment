variable "kubernetes_path" {
  type = string
  description = "Cluster path"
}

variable "namespace_name" {
  type = string
  description = "Name of namespace"
}

variable "app_name" {
  type = string
  description = "Name of application"
}

variable "image_name" {
  type = string
  description = "Full name of image"
}

variable "host_port" {
  type = number
  description = "Container port number to expose"
}

variable "ingress_port" {
  type = number
  description = "Ingress port number"
}
