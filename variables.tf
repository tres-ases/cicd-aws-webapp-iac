# Network
variable "vpc_id"{
    type = string
    default = "vpc-0359b647f99881647"
}
variable "stage"{
    type = string
    default = "dev"
}
variable "subnets"{
    type = list(string)
    default = ["subnet-0f8b1c9a6a3d269c3","subnet-0df9491a81624fef2","subnet-0c81773cbeecd455e"]
}
variable "region"{
    type = string
    default = "us-west-2"
}
#COGNITO
variable "CognitoUserPoolName"{
    type = string
    default = "CognitoAuthApiUserPoolThor"
}
variable "CognitoUserPoolClientName"{
    type = string
    default = "CognitoAuthApiClientThor"
}
variable "CognitoUserPoolDomain"{
    type = string
    default = "CognitoDomainThor"
}
variable "cognito_config"{
    type = object({
        pw_minimum_length = number
        pw_temporary_password_validity_days = number
        })
    default = {
        pw_minimum_length = 8
        pw_temporary_password_validity_days = 30
    }
}