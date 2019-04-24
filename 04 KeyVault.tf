#################################################################
#This file allows the creation of a azure keyvault
#################################################################

#####################################################################
# keyvault Creation
######################################################################

#Keyvault Random prefix
module "KeyVaultRandomprefix" {
    #Module source
    source = "github.com/dfrappart/Terra-AZModuletest//Modules//00 RandomString/"

    #Module variables
    stringlenght        = "5"
    stringspecial       = "false"
    stringupper         = "false"
    stringnumber        = "false"
    
}


#keyvault creation

module "KeyVault" {

  #Module source
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//27 Keyvault"

  #Module variables
  KeyVaultName            = "${module.KeyVaultRandomprefix.Result}keyvault"
  KeyVaultRG              = "${module.ResourceGroupHubSpoke.Name}"
  KeyVaultObjectIDPolicy2 = "${var.AzureServicePrincipalInteractive}"
  KeyVaultObjectIDPolicy1 = "${var.AzureTFSP}"
  KeyVaultTenantID        = "${var.AzureTenantID}"
  KeyVaultSKUName         = "premium"
  EnvironmentTag          = "${var.EnvironmentTag}"
  EnvironmentUsageTag     = "${var.EnvironmentUsageTag}"
  OwnerTag                = "${var.OwnerTag}"
  ProvisioningDateTag     = "${var.ProvisioningDateTag}"
}


module "StoringAKSAADServerAppIdInKeyVault" {

  #Module source
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//28 KeyvaultSecret"

  #Module variables
  PasswordName            = "AKSAADAppServerId"
  PasswordValue           = "${var.AKSAADAppServer_AppId}"
  KeyVaultId              = "${module.KeyVault.Id}"
  EnvironmentTag          = "${var.EnvironmentTag}"
  EnvironmentUsageTag     = "${var.EnvironmentUsageTag}"
  OwnerTag                = "${var.OwnerTag}"
  ProvisioningDateTag     = "${var.ProvisioningDateTag}"

}

module "StoringAKSAADServerAppSecretInKeyVault" {

  #Module source
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//28 KeyvaultSecret"

  #Module variables
  PasswordName            = "AKSAADAppServerSecret"
  PasswordValue           = "${var.AKSAADAppServer_AppSecret}"
  KeyVaultId              = "${module.KeyVault.Id}"
  EnvironmentTag          = "${var.EnvironmentTag}"
  EnvironmentUsageTag     = "${var.EnvironmentUsageTag}"
  OwnerTag                = "${var.OwnerTag}"
  ProvisioningDateTag     = "${var.ProvisioningDateTag}"

}

module "StoringAKSAADClientAppIdInVault" {

  #Module source
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//28 KeyvaultSecret"

  #Module variables
  PasswordName            = "AKSAADAppClientId"
  PasswordValue           = "${var.AKSAADAppClient_AppId}"
  KeyVaultId              = "${module.KeyVault.Id}"
  EnvironmentTag          = "${var.EnvironmentTag}"
  EnvironmentUsageTag     = "${var.EnvironmentUsageTag}"
  OwnerTag                = "${var.OwnerTag}"
  ProvisioningDateTag     = "${var.ProvisioningDateTag}"

}

module "StoringAKSSPAppIdInVault" {

  #Module source
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//28 KeyvaultSecret"

  #Module variables
  PasswordName            = "AKSSPAppId"
  PasswordValue           = "${var.AKSSP_AppId}"
  KeyVaultId              = "${module.KeyVault.Id}"
  EnvironmentTag          = "${var.EnvironmentTag}"
  EnvironmentUsageTag     = "${var.EnvironmentUsageTag}"
  OwnerTag                = "${var.OwnerTag}"
  ProvisioningDateTag     = "${var.ProvisioningDateTag}"

}

module "StoringAKSSPSecretInVault" {

  #Module source
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//28 KeyvaultSecret"

  #Module variables
  PasswordName            = "AKSSPSecret"
  PasswordValue           = "${var.AKSSP_Secret}"
  KeyVaultId              = "${module.KeyVault.Id}"
  EnvironmentTag          = "${var.EnvironmentTag}"
  EnvironmentUsageTag     = "${var.EnvironmentUsageTag}"
  OwnerTag                = "${var.OwnerTag}"
  ProvisioningDateTag     = "${var.ProvisioningDateTag}"

}

module "StoringWinDefaultPWDInVault" {

  #Module source
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//28 KeyvaultSecret"

  #Module variables
  PasswordName            = "DefaultWinPWD"
  PasswordValue           = "${var.VMAdminPassword}"
  KeyVaultId              = "${module.KeyVault.Id}"
  EnvironmentTag          = "${var.EnvironmentTag}"
  EnvironmentUsageTag     = "${var.EnvironmentUsageTag}"
  OwnerTag                = "${var.OwnerTag}"
  ProvisioningDateTag     = "${var.ProvisioningDateTag}"

}

module "StoringSSHPublicKeyInVault" {

  #Module source
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//28 KeyvaultSecret"

  #Module variables
  PasswordName            = "SSHPublicKey"
  PasswordValue           = "${var.AzurePublicSSHKey}"
  KeyVaultId              = "${module.KeyVault.Id}"
  EnvironmentTag          = "${var.EnvironmentTag}"
  EnvironmentUsageTag     = "${var.EnvironmentUsageTag}"
  OwnerTag                = "${var.OwnerTag}"
  ProvisioningDateTag     = "${var.ProvisioningDateTag}"

}