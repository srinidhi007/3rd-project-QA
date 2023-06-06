# Azure GUIDS
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

# Resource Group/Location
variable "location" {}
variable "resource_group" {}
variable "application_type" {}
# Tags
variable tier {}
variable deployment {}

# name 3rd project udacity qa
variable "qa" {
    description = "prefix"
    type        = string
    default = "qa3"
}
