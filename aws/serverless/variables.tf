variable "region" {
  description = "Região AWS"
  type        = string
  default     = "us-east-1"
}

variable "assume_role" {
  description = "ARN da role para assumir"
  type = object({
    role_arn    = string
    external_id = string
  })
}

variable "tags" {
  description = "Tags para os recursos"
  type        = map(string)
}

variable "lambda_exec_role_name" {
  type        = string
  description = "The secret of the user pool client"
  default     = "default-lambda-role"
}

variable "lambda_function_name" {
  type        = string
  description = "The name of the lambda function"
  default     = "authCpfLambda"
}

variable "lambda_function_handler" {
  type        = string
  description = "The handler of the lambda function"
  default     = "index.handler"
}

variable "lambda_function_runtime" {
  type        = string
  description = "The runtime of the lambda function"
  default     = "nodejs22.x"
}

variable "gateway_name" {
  type        = string
  description = "The name of the gateway"
  default     = "default-gateway"
}


variable "user_pool" {
  description = "Configuração do Cognito"
  type = object({
    name        = string
    client_name = string
  })

  default = {
    name        = "user-pool"
    client_name = "user-pool-client"
  }
}

variable "gateway" {
  description = "Configuração do Gateway"
  type = object({
    name = string
  })

  default = {
    name = "default-gateway"
  }
}
