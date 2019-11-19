######################################################################
# This module create a Windows VM
######################################################################

locals {
  Prefix = "${lower(var.environmentTag)}${lower(var.ownerTag)}"
  VMHostName = "vm${lower(var.environmentTag)}${lower(var.ownerTag)}${lower(var.VMRole)}"
  
}



######################################################################
#VM RG

resource "azurerm_resource_group" "RGVM" {

    
    name        = "rg_${local.Prefix}_${lower(var.RGVMRole)}"
    location    = var.AzureRegion

    tags = {
      application       = var.applicationTag
      costcenter        = var.costcenterTag
      businessunit       = var.businessunitTag
      managedby         = var.managedbyTag
      environvment      = var.environmentTag
      hostname          = var.hostnameTag
      owner             = var.ownerTag
      role              = var.VMRole
      createdby         = var.createdbyTag

    }

}

######################################################################
#Application Security Group Creation

resource "azurerm_application_security_group" "ASGVM" {

    
    name        = "asg_${local.Prefix}_${lower(var.ASGRole)}"
    location    = azurerm_resource_group.RGVM.location
    resource_group_name          = azurerm_resource_group.RGVM.name

    tags = {
      application       = var.applicationTag
      costcenter        = var.costcenterTag
      businessunit       = var.businessunitTag
      managedby         = var.managedbyTag
      environvment      = var.environmentTag
      hostname          = var.hostnameTag
      owner             = var.ownerTag
      role              = var.VMRole
      createdby         = var.createdbyTag
    }

}


######################################################################
#PIP Creation

resource "azurerm_public_ip" "VMPublicIPZoneRedundant" {
  #count                        = "${var.IsZoneRedundant == "true" ? var.PublicIPCount : 0}"
  name                         = "pip_${local.Prefix}_${lower(var.VMPIPRole)}"
  location                     = azurerm_resource_group.RGVM.location
  resource_group_name          = azurerm_resource_group.RGVM.name
  allocation_method            = "Static"
  sku                          = "standard"
  domain_name_label            = "${local.Prefix}pip-${lower(var.VMPIPRole)}"


  tags = {
      application       = var.applicationTag
      costcenter        = var.costcenterTag
      businessunit       = var.businessunitTag
      managedby         = var.managedbyTag
      environvment      = var.environmentTag
      hostname          = var.hostnameTag
      owner             = var.ownerTag
      role              = var.VMRole
      createdby         = var.createdbyTag
  }
}

######################################################################
#NIC Creation

resource "azurerm_network_interface" "VMNIC" {
  #count               = "${var.NICCount}"
  name                = "nic_${local.Prefix}_${var.NICRole}"
  location            = azurerm_resource_group.RGVM.location
  resource_group_name = azurerm_resource_group.RGVM.name

  ip_configuration {
    name                           = "${local.Prefix}${var.NICRole}ipconfig"
    subnet_id                      = var.SubnetId
    private_ip_address_allocation  = "dynamic"
    public_ip_address_id           = azurerm_public_ip.VMPublicIPZoneRedundant.id
    primary                        = var.Primary
    #application_security_group_ids = ["${var.ASGIds}"]
  }

    tags = {
      application       = var.applicationTag
      costcenter        = var.costcenterTag
      businessunit       = var.businessunitTag
      managedby         = var.managedbyTag
      environvment      = var.environmentTag
      hostname          = var.hostnameTag
      owner             = var.ownerTag
      role              = var.VMRole
      createdby         = var.createdbyTag
    }
}

######################################################################
#NIC ASG Association

resource "azurerm_network_interface_application_security_group_association" "VMASG" {
  network_interface_id          = azurerm_network_interface.VMNIC.id
  ip_configuration_name         = "${local.Prefix}${var.NICRole}ipconfig"
  application_security_group_id = azurerm_application_security_group.ASGVM.id
}



######################################################################
#VM Creation

resource "azurerm_virtual_machine" "TerraVMWithoutDataDisk" {
  
  name                  = local.VMHostName
  location              = azurerm_resource_group.RGVM.location
  resource_group_name   = azurerm_resource_group.RGVM.name
  network_interface_ids = ["${azurerm_network_interface.VMNIC.id}"]
  vm_size               = var.VMSize
  zones                 = ["${var.VMZone}"]


  boot_diagnostics {
    enabled     = true
    storage_uri = var.DiagnosticDiskURI
  }

  storage_image_reference {
    #get appropriate image info with the following command
    #Get-AzureRmVMImageSku -Location westeurope -Offer windowsserver -PublisherName microsoftwindowsserver
    publisher = var.VMPublisherName

    offer   = var.VMOffer
    sku     = var.VMsku
    version = "latest"
  }

  storage_os_disk {
    name              = "hdd_${local.Prefix}_${lower(var.VMDiskRole)}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.VMStorageTier
    disk_size_gb      = var.OSDisksize
 
  }

/*
  storage_data_disk {
    name            = "${element(var.DataDiskName,count.index)}"
    managed_disk_id = "${element(var.DataDiskId,count.index)}"
    create_option   = "Attach"
    lun             = 0
    disk_size_gb    = "${element(var.DataDiskSize,count.index)}"
  }
*/

  os_profile {
    computer_name  = "${substr(local.VMHostName,0,14)}"
    admin_username = var.VMAdminName
    admin_password = var.VMAdminPassword
    custom_data    = file("${path.root}${var.CloudinitscriptPath}")
  }

  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = false
    #timezone = var.TimeZoneTag
  }

  tags = {
      application       = var.applicationTag
      costcenter        = var.costcenterTag
      businessunit       = var.businessunitTag
      managedby         = var.managedbyTag
      environvment      = var.environmentTag
      hostname          = var.hostnameTag
      owner             = var.ownerTag
      role              = var.VMRole
      createdby         = var.createdbyTag
      backup            = "true"
  }
}

#Adding BGInfo to VM

resource "azurerm_virtual_machine_extension" "Terra-BGInfoAgentWithoutDataDisk" {
    
  name                 = "${local.Prefix}${lower(var.VMRole)}bginfo"
  location              = azurerm_resource_group.RGVM.location
  resource_group_name   = azurerm_resource_group.RGVM.name
  virtual_machine_name = azurerm_virtual_machine.TerraVMWithoutDataDisk.name
  publisher            = "microsoft.compute"
  type                 = "BGInfo"
  type_handler_version = "2.1"

  tags = {
      application       = var.applicationTag
      costcenter        = var.costcenterTag
      businessunit      = var.businessunitTag
      managedby         = var.managedbyTag
      environvment      = var.environmentTag
      hostname          = var.hostnameTag
      owner             = var.ownerTag
      role              = var.VMRole
      createdby         = var.createdbyTag

  }
}