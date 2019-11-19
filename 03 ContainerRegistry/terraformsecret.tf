#################################################################
# Variables for Azure Registration
#################################################################

variable "AzureSubscriptionID" {
  type    = string
  default = "16e85b36-5c9d-48cc-a45d-c672a4393c36"
}

variable "AzureClientID" {
  type    = string
  default = "af61e654-2a5a-4468-b387-b8791d8dee0f"
}

variable "AzureObjectID" {
  type    = string
  default = "52d024a0-6e84-4b5b-b059-fd8c1f6e1cf2"
}

variable "AzureClientSecret" {
  type    = string
  default = "LCMFq4+wBPzLwizi2f5NQI65VDvWTaKgsTxLTWIak80="

}

variable "AzureTenantID" {
  type    = string
  default = "e0c45235-95fe-4bd6-96ca-2d529f0ebde4"
}



#################################################################
# Variables for AKS config
#################################################################


#Service Principal for AKS

variable "AKSSP_AppId" {
  type    = string
  default = "4be8d392-56e0-40cf-9de9-410a49742f15"

}

variable "AKSSP_Secret" {
  type    = string
  default = "0ezenHi3SjIFxPLa9/5Ku0AQBDkagGrsWteF2e7jXQY="


}



#################################################################
#Remote State variable
#################################################################

variable "statestoa" {
  type    = string
  default = "stoarstatedf"

}

variable "statecontainer" {
  type    = string
  default = "terraform"

}

variable "statekey" {
  type    = string
  default = "LabAKSFoundationInfra.tf"

}

variable "statestoakey" {
  type    = string
  default = "mVVGQhDNUIJJpjw343As3++1a5GrEv9mc0F4HowaipxGfI4KbntPHpUnKQWvZ/W9mfni5sQnyfhXmaSSakGw5Q=="

}

#################################################################
#Other sub id
#################################################################




#DF Labs 1

variable "AzureSubscriptionID1" {
  type    = string
  default = "f1f020d0-0fa6-4d01-b816-5ec60497e851"
}

#DF Labs 2

variable "AzureSubscriptionID2" {
  type    = string
  default = "bb4e88a4-879f-4b1d-94f4-1f48bfc1c5a8"
}

#DF Labs 3

variable "AzureSubscriptionID3" {
  type    = string
  default = "0cfadfdd-0ccd-468a-bdf4-77af40e00795"
}

#DF MVP Sponsorship

variable "AzureSubscriptionMVPSponsor" {
  type    = string
  default = "16e85b36-5c9d-48cc-a45d-c672a4393c36"
}

variable "AzureSubscriptionMVPMSDN" {
  type    = string
  default = "49816259-cb52-4fe5-8d6f-9358ad94332c"
}