########################################################################
#This module creates the association of a VM with a target backup Policy
########################################################################

#Variable declaration for Module

# The resource group containing the Recovery vault, used also to host this object
variable "RGRecoveryVaultName" {
  type    = string
  description = "The resource group containing the Recovery vault, used also to host this object"
}

#The Recovery Vault Name
variable "RecoveryVaultName" {
  type = string
  description = "The Recovery Vault Name"
}

#The id of the VM to associate to the policy
variable "VMId" {
  type    = string
  description = "The id of the VM to associate to the policy"
}

#The Id of the policy for prod VMs
variable "ProdPolicyId" {
  type = string
  description = "The Id of the policy for prod VMs"
}

#The Id of the policy for non prod VMs 
variable "NonProdPolicyId" {
  type = string
  description = "The Id of the policy for non prod VMs"
}

# Variable to define the Tag

variable "applicationTag" {
  type    = string
  description = "Tag describing the application associated to the resource"
  default = "INFR"

}


variable "costcenterTag" {
  type    = string
  default = "N/A"
  description = "Tag indacating the cost center "
}

variable "businessunitTag" {
  type    = string
  default = "N/A"
  description = "Tag indacating the business unit"
}

variable "managedbyTag" {
  type    = string
  default = "INFR"
  description = "Tag indacating who manage the resource"
}

variable "environmentTag" {
  type    = string
  default = "DEV"
  description = "Tag indacating type of environment, DEV, PRD, PPR, ..."
}

variable "hostnameTag" {
  type    = string
  default = "N/A"
  description = "Tag indacating type Hostname, if applicable."
}

variable "ownerTag" {
  type    = string
  default = "That would be me"
  description = "Tag specifying the owner of the resources"
}

variable "roleTag" {
  type    = string
  default = "N/A"
  description = "Tag specifying the owner of the resources"
}

variable "createdbyTag" {
  type    = string
  default = "Terraform"
  description = "Tag describing the way of provisioning, default to terraform for terraform config"
}

variable "backupTag" {
  type    = string
  default = "false"
  description = "Tag describing the activation of the backup or not"
}

