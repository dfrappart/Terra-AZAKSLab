######################################################
# Variables for Template
######################################################

# Variable to define the Azure Region

variable "AzureRegion" {
  type    = string
  default = "westeurope"
}


# Variable to define the Resource Group Name

variable "RGHubName" {
  type    = string

}

variable "RGLogsName" {
  type    = string

}

variable "RGFilesName" {
  type    = string

}

variable "RGkvName" {
  type    = string

}


#Variable defining the vnet name

variable "VNetHubName" {
  type    = string

}

#Variable defining the vnet ip range

variable "VNetHubIPRange" {
  type    = list

}



variable "SubnetAddressRange" {
  #Note: Subnet must be in range included in the vNET Range
  type = list
}



variable "SubnetName" {
  type = list
}


# variable defining storage account tier

variable "storageaccounttier" {
  default = {
    "0" = "standard"
    "1" = "premium"
  }
}

# variable defining storage replication type

variable "storagereplicationtype" {
  default = {
    "0" = "LRS"
    "1" = "GRS"
    "2" = "RAGRS"
    "3" = "ZRS"
  }
}

# Variable Azure Firewall

variable "AZFWHub" {
  type = string
  description = "Name of the AZ FW instance"
}


#Variable defining the Log analytics workspace 

variable "LAW" {
  type = string
}

#Variable for Log analytics solution

variable "LogAnalyticsSolutionName" {
  type = string

}

variable "LogAnalyticsSolutionPublisher" {
  type = string

}

variable "LogAnalyticsSolutionProductName" {
  type = string

}




#Tags definition

variable "EnvironmentTag" {
  type = string
}

variable "EnvironmentUsageTag" {
  type = string
}

variable "OwnerTag" {
  type = string
}

variable "ProvisioningDateTag" {
  type = string
}

