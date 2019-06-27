######################################################################
# This file deploy an AKS cluster in advanced networking mode
######################################################################

#Creating a log analytics workspace

module "LAWSRandomSuffix" {
    #Module source
    #source = "github.com/dfrappart/Terra-AZModuletest//Modules//00 RandomString/"
    source = "./Modules/00 RandomString"

    #Module variables
    stringlenght        = "5"
    stringspecial       = "false"
    stringupper         = "false"
    
}

module "SharedLAWS" {
    #Module source
    #source = "github.com/dfrappart/Terra-AZModuletest//Modules//45 Log analytics workspace/"
    source = "./Modules/45 Log analytics workspace"

    #Module variables
    LAWName             = "${var.LAW}${module.LAWSRandomSuffix.Result}"
    LAWLocation         = "${var.AzureRegion}"
    LAWRGName           = "${module.ResourceGroupHubSpoke.Name}"
    EnvironmentTag      = "${var.EnvironmentTag}"
    EnvironmentUsageTag = "${var.EnvironmentUsageTag}"
    OwnerTag            = "${var.OwnerTag}"
    ProvisioningDateTag = "${var.ProvisioningDateTag}"
}


#Creating log analytics solution for containers

module "SharedLASol" {

    #Module source
    #source = "github.com/dfrappart/Terra-AZModuletest//Modules//46 Log analytics solution/"
    source = "./Modules/46 Log analytics solution"

    #Module variables
    LASolName        = "${var.LogAnalyticsSolutionName}"
    LASolLocation    = "${var.AzureRegion}"
    LASolRGName      = "${module.ResourceGroupHubSpoke.Name}"
    LAWId            = "${module.SharedLAWS.Id}"
    LAWName          = "${module.SharedLAWS.Name}"
    LASolPublisher   = "${var.LogAnalyticsSolutionPublisher}"
    LASolProductName = "${var.LogAnalyticsSolutionProductName}"
}