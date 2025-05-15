variable "tenancy_ocid" {
  description = "The OCID of the tenancy."
  type        = string
}

variable "user_ocid" {
  description = "The OCID of the user."
  type        = string
}

variable "region" {
  description = "The region to deploy resources in."
  type        = string
}

variable "compartment_ocid" {
  description = "The OCID of the compartment to deploy resources in."
  type        = string
}

variable "availability_domain" {
  description = "The availability domain for the compute instance."
  type        = string
}

variable "subnet_ocid" {
  description = "The OCID of the subnet to attach the instance to."
  type        = string
}

variable "ssh_public_key_file" {
  description = "Path to the SSH public key file."
  type        = string
}

variable "instance_image_ocid" {
  description = "The OCID of the image to use for the instance."
  type        = string
}

# Optional values when not using local API key-based auth
variable "private_key_path" {
  description = "Path to the private key file for API authentication."
  type        = string
  default     = null
}

variable "fingerprint" {
  description = "Fingerprint for the public API key."
  type        = string
  default     = null
}
