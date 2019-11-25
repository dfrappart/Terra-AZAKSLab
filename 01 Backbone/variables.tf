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

########################################################################
#Secret Section

#################################################################
# Variables for Azure Registration
#################################################################

variable "AzureSubscriptionID" {
  type    = string

}

variable "AzureClientID" {
  type    = string

}

variable "AzureObjectID" {
  type    = string

}

variable "AzureClientSecret" {
  type    = string


}

variable "AzureTenantID" {
  type    = string

}

#################################################################
# Variables for VM config
#################################################################

# Variable defining VM Admin Name

variable "VMAdminName" {
  type    = string
  default = "vmadmin"
}

# Variable defining VM Admin password

variable "VMAdminPassword" {
  type    = string

}

# Variable defining SSH Key
variable "AzurePublicSSHKey" {
  type    = string
}

#################################################################
# Variables for AKS config
#################################################################

#Secret for AAD integration in AKS

variable "AKSAADAppServer_AppId" {
  type    = string


}

variable "AKSAADAppServer_AppSecret" {
  type    = string

  
}

variable "AKSAADAppClient_AppId" {
  type    = string


}

#Service Principal for AKS

variable "AKSSP_AppId" {
  type    = string


}

variable "AKSSP_Secret" {
  type    = string



}

#################################################################
# Variable KeyVault
#################################################################
/*
#Terraform service principal ID

variable "AzureTFSP" {
  type = string
  default = "45f1bbc1-c7cd-4490-8991-144403c0ffc5"
}
*/
#Mine :)

variable "AzureServicePrincipalInteractive" {
  type    = string


}



