variable "vpc_endpoints"{
    type = list(string)
    description = "List of vpc endpointsto create"
    default = [ "ssm", "ssmmessages" ]

}
  
