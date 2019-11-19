# Variable to define the Tag

variable "applicationTag" {
  type    = string
  description = "Tag describing the application associated to the resource"
  default = "INFR"

}

variable "longcodeTag" {
  type    = string
  default = "INFR"
  description = "Tag indacating the long code, with 4 characters "
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

variable "RGNSGReference" {
  type    = string

  description = "The RG in which the NSG is located"
}

variable "NSGReference" {
  type    = string

  description = "The NSG on which the rules are added"
}




variable "AzureRegion" {
  type    = string
  default = "westeurope"
  description = "Azure Region"
}


variable "RGVMRole" {
  type    = string
  default = "rsg008mg"
  description = "VM Role"
}

variable "ASGRole" {
  type    = string
  default = "asg001nt"
  description = "ASG Role"
}


variable "NICRole" {
  type    = string
  default = "nic001nt"
  description = "NIC Role"
}

variable "VMRole" {
  type    = string
  default = "avm001cp"
  description = "VM Role"
}

variable "VMDiskRole" {
  type    = string
  default = "hdd001ST"
  description = "VM Role"
}

variable "VMPublisherName" {
  type    = string
  default = "MicrosoftWindowsServer"
  description = "VM Publisher name"
}

variable "VMOffer" {
  type    = string
  default = "WindowsServer"
  description = "VM offer"
}

variable "VMsku" {
  type    = string
  default = "2019-Datacenter"
  description = "VM version"
}

variable "Primary" {
  type    = string
  default = "true"
}

variable "VMAdminName" {
  type    = string

  description = "VM Admin name"
}

variable "VMAdminPassword" {
  type    = string

  description = "VM Password"
}

variable "SubnetId" {
  type    = string

  description = "Subnet Id of the NIC"
}

variable "VMSize" {
  type    = string

  description = "Instance size"
}

variable "VMZone" {
  type    = string
  description = "Instance az"
}

variable "VMStorageTier" {
  type    = string
  description = "Storage tier"
  default = "Premium_LRS"
}

variable "OSDisksize" {
  type    = string
  description = "OSDisksizer"
  default = "254"
}


variable "CloudinitscriptPath" {
  type = string
  default = "/Scripts/example.ps1"
}

variable "DiagnosticDiskURI" {
  type = string
  description = "Storage account uri for boot diagnostic logs"
}