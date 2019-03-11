######################################################################
# This file deploy an AKS cluster in advanced networking mode
######################################################################

#Creating a log analytics workspace

module "AKSRandomSuffix" {
    #Module source
    source = "github.com/dfrappart/Terra-AZModuletest//Modules//00 RandomString/"

    #Module variables
    stringlenght        = "5"
    stringspecial       = "false"
    stringupper         = "false"
    
}

module "AKSWorkspace" {
    #Module source
    source = "github.com/dfrappart/Terra-AZModuletest//Modules//45 Log analytics workspace/"

    #Module variables
    LAWName             = "${var.AKSWorkspaceName}${module.AKSRandomSuffix.Result}"
    LAWLocation         = "${var.AzureRegion}"
    LAWRGName           = "${module.ResourceGroupAKS.Name}"
    LAWLocation         = "${var.AzureRegion}"
    EnvironmentTag      = "${var.EnvironmentTag}"
    EnvironmentUsageTag = "${var.EnvironmentUsageTag}"
    OwnerTag            = "${var.OwnerTag}"
    ProvisioningDateTag = "${var.ProvisioningDateTag}"
}


#Creating log analytics solution for containers

module "AKSLASol" {

    #Module source
    source = "github.com/dfrappart/Terra-AZModuletest//Modules//46 Log analytics solution/"

    #Module variables
    LASolName        = "${var.LogAnalyticsSolutionName}"
    LASolLocation    = "${var.AzureRegion}"
    LASolRGName      = "${module.ResourceGroupAKS.Name}"
    LAWId            = "${module.AKSWorkspace.Id}"
    LAWName          = "${module.AKSWorkspace.Name}"
    LASolPublisher   = "${var.LogAnalyticsSolutionPublisher}"
    LASolProductName = "${var.LogAnalyticsSolutionProductName}"
}