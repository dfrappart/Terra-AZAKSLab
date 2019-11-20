######################################################
# Variables for VM config
######################################################

variable "AzureRegion" {
  type    = string
  default = "westeurope"
}

variable "RGVMRole" {
  type    = string
  default = "vmtest-1"
}

variable "ASGRole" {
  type    = string
  default = "vmtest-1"
}

variable "VMPIPRole" {
  type    = string
  default = "vmtest-1"
}

variable "NICRole" {
  type    = string
  default = "vmtest-1"
}

variable "VMRole" {
  type    = string
  default = "vmtest-1"
}

variable "VMAdminName" {
  type    = string
  default = "VMAdmin"
}

variable "VMSize" {
  type    = string
  default = "Standard_F4S"
}

variable "VMZone" {
  type    = string
  default = 1
}

# Variable to define the Tag

variable "applicationTag" {
  type        = string
  description = "Tag describing the application associated to the resource"
  default     = "INFR"

}

variable "costcenterTag" {
  type    = string
  default = "N/A"
  description = "Tag indacating the Section "
}

variable "businessunitTag" {
  type    = string
  default = "N/A"
  description = "Tag indacating the Domain"
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
  default = "hubzone"
  description = "Tag specifying the owner of the resources"
}

variable "createdbyTag" {
  type    = string
  default = "Terraform"
  description = "Tag describing the way of provisioning, default to terraform for terraform config"
}

variable "backupTag" {
  type    = string
  default = "True"
  description = "Tag describing the activation of the backup or not"
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

variable "CloudinitscriptPath" {
  type    = string
  default = "/Scripts/example.ps1"

}

# variable defining storage account tier

variable "storageaccounttier" {
  type = string
  default = "premium"
  
}

# variable defining storage replication type

variable "storagereplicationtype" {
  type = string
  default = "LRS"
    
  
}

variable "OSDisksize" {
  type = string
  default = 254
  
}

variable "VMDiskRole" {
  type = string
  default = "vmhub1"
}


# variable defining storage account tier for managed disk

variable "Manageddiskstoragetier" {
  type = string
  default = "premium_lrs"
  
}


# variable defining VM image 

variable "PublisherName" {
  default = "microsoftwindowsserver"
    
}

variable "Offer" {
  default = "WindowsServer"
   
}

variable "sku" {
  default = "2019-Datacenter"
    
}


#################################################################
# Provider Config
#################################################################


variable "AzureSubscriptionID" {
  type    = string
  description = "The Subscription id required for the provider authentication"
}

variable "AzureClientID" {
  type    = string
  default = "The Azure AD ID used by terraform on the subscription"
}


variable "AzureClientSecret" {
  type    = string
  default = "The Azure AD secret used by terraform for authentication"

}

variable "AzureTenantID" {
  type    = string
  default = "The Azure AD Tenant ID"
}

##############################################
#Variable for using state as a data source

variable "statestoa" {
  type    = string
  description = "the name of the storage account storing the state of the 02 automation setup configuration"
}

variable "statecontainer" {
  type    = string
  description = "The name of the container in which the state is stored"
}

variable "statestoakey" {
  type    = string
  description = "The storage access key of the storage account"
}

variable "statekey" {
  type    = string
  default = "hubsetup.tfstate"
  description = "the name of the file containing the state of the 02 Hub configuration"
}

variable "statekeykeyvault" {
  type    = string
  default = "Keyvaultsetup.tfstate"
  description = "The name of the file containing the state of the key vault"
}

variable "statekeyrecoveryvault" {
  type    = string
  default = "statekeyrecoveryvault.tfstate"
  description = "The name of the file containing the state of the recovery vault"
}

