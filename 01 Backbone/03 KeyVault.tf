#################################################################
#This file allows the creation of a azure keyvault
#################################################################

#####################################################################
# keyvault Creation
######################################################################

#RG KeyVault

module "ResourceGroupKeyVault" {
  #Module Location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//01 ResourceGroup/"
  source = "./Modules/01 ResourceGroup"

  #Module variable
  RGName              = "${var.RGkvName}${var.EnvironmentTag}"
  RGLocation          = var.AzureRegion
  EnvironmentTag      = var.EnvironmentTag
  EnvironmentUsageTag = var.EnvironmentUsageTag
  OwnerTag            = var.OwnerTag
  ProvisioningDateTag = var.ProvisioningDateTag

}


#Keyvault Random prefix
module "KeyVaultRandomprefix" {
  #Module source
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//00 RandomString/"
  source = "./Modules/00 RandomString"

  #Module variables
  stringlenght        = "5"
  stringspecial       = "false"
  stringupper         = "false"
  stringnumber        = "false"
    
}


#keyvault creation

module "KeyVault" {

  #Module source
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//27 Keyvault"
  source = "./Modules/05 Keyvault"

  #Module variables
  KeyVaultName            = "${module.KeyVaultRandomprefix.Result}keyvault"
  KeyVaultRG              = module.ResourceGroupKeyVault.Name
  KeyVaultTenantID        = var.AzureTenantID
  KeyVaultSKUName         = "standard"
  EnvironmentTag          = var.EnvironmentTag
  EnvironmentUsageTag     = var.EnvironmentUsageTag
  OwnerTag                = var.OwnerTag
  ProvisioningDateTag     = var.ProvisioningDateTag
}

data "azurerm_client_config" "currentclientconfig" {}



module "UserAccessPolicy" {
  #Module Source
  source = "./Modules/06 KeyVault Access Policy"

  #Modules Variables
  VaultId             = module.KeyVault.Id
  RGVaultName           = module.ResourceGroupKeyVault.Name
  KeyVaultTenantId      = var.AzureTenantID
  KeyVaultAPObjectId    = var.AzureServicePrincipalInteractive
}


module "TerraformAccessPolicy" {
  #Module Source
  source = "./Modules/06 KeyVault Access Policy"

  #Modules Variables
  VaultId             = module.KeyVault.Id
  RGVaultName           = module.ResourceGroupKeyVault.Name
  KeyVaultTenantId      = var.AzureTenantID
  KeyVaultAPObjectId    = data.azurerm_client_config.currentclientconfig.service_principal_object_id
}


module "StoringAKSAADServerAppIdInKeyVault" {

  #Module source
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//28 KeyvaultSecret"
  source = "./Modules/07 KeyvaultSecret"

  #Module variables
  PasswordName            = "AKSAADAppServerId"
  PasswordValue           = var.AKSAADAppServer_AppId
  KeyVaultId              = module.TerraformAccessPolicy.KeyVaultId
  EnvironmentTag          = var.EnvironmentTag
  EnvironmentUsageTag     = var.EnvironmentUsageTag
  OwnerTag                = var.OwnerTag
  ProvisioningDateTag     = var.ProvisioningDateTag

}

module "StoringAKSAADServerAppSecretInKeyVault" {

  #Module source
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//28 KeyvaultSecret"
  source = "./Modules/07 KeyvaultSecret"

  #Module variables
  PasswordName            = "AKSAADAppServerSecret"
  PasswordValue           = var.AKSAADAppServer_AppSecret
  KeyVaultId              = module.TerraformAccessPolicy.KeyVaultId
  EnvironmentTag          = var.EnvironmentTag
  EnvironmentUsageTag     = var.EnvironmentUsageTag
  OwnerTag                = var.OwnerTag
  ProvisioningDateTag     = var.ProvisioningDateTag

}

module "StoringAKSAADClientAppIdInVault" {

  #Module source
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//28 KeyvaultSecret"
  source = "./Modules/07 KeyvaultSecret"

  #Module variables
  PasswordName            = "AKSAADAppClientId"
  PasswordValue           = var.AKSAADAppClient_AppId
  KeyVaultId              = module.TerraformAccessPolicy.KeyVaultId
  EnvironmentTag          = var.EnvironmentTag
  EnvironmentUsageTag     = var.EnvironmentUsageTag
  OwnerTag                = var.OwnerTag
  ProvisioningDateTag     = var.ProvisioningDateTag

}

module "StoringAKSSPAppIdInVault" {

  #Module source
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//28 KeyvaultSecret"
  source = "./Modules/07 KeyvaultSecret"

  #Module variables
  PasswordName            = "AKSSPAppId"
  PasswordValue           = var.AKSSP_AppId
  KeyVaultId              = module.TerraformAccessPolicy.KeyVaultId
  EnvironmentTag          = var.EnvironmentTag
  EnvironmentUsageTag     = var.EnvironmentUsageTag
  OwnerTag                = var.OwnerTag
  ProvisioningDateTag     = var.ProvisioningDateTag

}

module "StoringAKSSPSecretInVault" {

  #Module source
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//28 KeyvaultSecret"
  source = "./Modules/07 KeyvaultSecret"

  #Module variables
  PasswordName            = "AKSSPSecret"
  PasswordValue           = var.AKSSP_Secret
  KeyVaultId              = module.TerraformAccessPolicy.KeyVaultId
  EnvironmentTag          = var.EnvironmentTag
  EnvironmentUsageTag     = var.EnvironmentUsageTag
  OwnerTag                = var.OwnerTag
  ProvisioningDateTag     = var.ProvisioningDateTag

}

module "StoringWinDefaultPWDInVault" {

  #Module source
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//28 KeyvaultSecret"
  source = "./Modules/07 KeyvaultSecret"

  #Module variables
  PasswordName            = "DefaultWinPWD"
  PasswordValue           = var.VMAdminPassword
  KeyVaultId              = module.TerraformAccessPolicy.KeyVaultId
  EnvironmentTag          = var.EnvironmentTag
  EnvironmentUsageTag     = var.EnvironmentUsageTag
  OwnerTag                = var.OwnerTag
  ProvisioningDateTag     = var.ProvisioningDateTag

}

module "StoringSSHPublicKeyInVault" {

  #Module source
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//28 KeyvaultSecret"
  source = "./Modules/07 KeyvaultSecret"

  #Module variables
  PasswordName            = "SSHPublicKey"
  PasswordValue           = var.AzurePublicSSHKey
  KeyVaultId              = module.TerraformAccessPolicy.KeyVaultId
  EnvironmentTag          = var.EnvironmentTag
  EnvironmentUsageTag     = var.EnvironmentUsageTag
  OwnerTag                = var.OwnerTag
  ProvisioningDateTag     = var.ProvisioningDateTag

}

