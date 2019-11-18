######################################################################
# This module create a keyvault resource
######################################################################

#Variable declaration for Module

variable "VaultId" {
  type = string
}

variable "RGVaultName" {
  type = string
}

variable "KeyVaultTenantId" {
  type = string
  default = "RSA"
}

variable "KeyVaultAPObjectId" {
  type = string
  default = "4096"
}

variable "Keyperms" {
  type = list
  default = ["backup","create","decrypt","delete","encrypt","get","import","list","purge","recover","restore","sign","unwrapKey","update","verify","wrapKey"]
}

variable "Secretperms" {
  type = list
  default = ["backup","delete","get","list","purge","recover","restore","set"]
}

variable "Certperms" {
  type = list
  default = ["backup","create","delete","deleteissuers","get","getissuers","import","list","listissuers","managecontacts","manageissuers","purge","recover","restore","setissuers","update"]
}

variable "Storageperms" {
  type = list
  default = ["backup", "delete", "deletesas", "get", "getsas", "list", "listsas", "purge", "recover", "regeneratekey", "restore", "set", "setsas","update"]
}
