######################################################
# Variables for Template
######################################################

# Variable to define the Azure Region

variable "AzureRegion" {
  type    = "string"
  default = "westeurope"
}


# Variable to define the Resource Group Name

variable "RGName" {
  type    = "string"

}

variable "RGBastionName" {
  type    = "string"

}


variable "RGAKSName" {
  type    = "string"

}
#Variable defining the vnet name

variable "VNet1Name" {
  type    = "string"

}

#Variable defining the vnet ip range

variable "VNet1IPRange" {
  type    = "list"

}

variable "VNet2Name" {
  type    = "string"

}

#Variable defining the vnet ip range

variable "VNet2IPRange" {
  type    = "list"

}

variable "VNet3Name" {
  type    = "string"

}

#Variable defining the vnet ip range

variable "VNet3IPRange" {
  type    = "list"

}

variable "SubnetAddressRange" {
  #Note: Subnet must be in range included in the vNET Range
  type = "map"
}



variable "SubnetName" {
  default = {
    "0" = "FE_Subnet"
    "1" = "BE_Subnet"
    "2" = "Bastion_Subnet"
    "3" = "AzureFirewallSubnet"
    "4" = "GatewaySubnet"
  }
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

# variable defining storage account tier for managed disk

variable "Manageddiskstoragetier" {
  default = {
    "0" = "standard_lrs"
    "1" = "premium_lrs"
    "2" = "standardssd_lrs"
    "3" = "ultrassd_lrs"
  }
}

# variable defining VM image 

# variable defining VM image 

variable "PublisherName" {
  default = {
    "0" = "microsoftwindowsserver"
    "1" = "MicrosoftVisualStudio"
    "2" = "canonical"
    "3" = "credativ"
    "4" = "Openlogic"
    "5" = "RedHat"
    "6" = "MicrosoftSQLServer"
  }
}

variable "Offer" {
  default = {
    "0" = "WindowsServer"
    "1" = "Windows"
    "2" = "ubuntuserver"
    "3" = "debian"
    "4" = "CentOS"
    "5" = "RHEL"
    "6" = "SQL2016SP1-WS2016"
  }
}

variable "sku" {
  default = {
    "0" = "2016-Datacenter"
    "1" = "Windows-10-N-x64"
    "2" = "16.04.0-LTS"
    "3" = "9"
    "4" = "7.4"
    "5" = "7.4"
    "6" = "Enterprise"
  }
}

#Variable definig the Log analytics workspace for AKS

variable "AKSWorkspaceName" {
  type = "string"
}

#Variable for Log analytics solution

variable "LogAnalyticsSolutionName" {
  type = "string"

}

variable "LogAnalyticsSolutionPublisher" {
  type = "string"

}

variable "LogAnalyticsSolutionProductName" {
  type = "string"

}

#Tags definiiton

variable "EnvironmentTag" {
  type = "string"
}

variable "EnvironmentUsageTag" {
  type = "string"
}

variable "OwnerTag" {
  type = "string"
}

variable "ProvisioningDateTag" {
  type = "string"
}

