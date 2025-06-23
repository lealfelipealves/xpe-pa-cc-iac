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

variable "user_pool_name" {
  type        = string
  description = "O nome do pool de usuários"
  default     = "default-user-pool"
}

variable "user_pool_client_name" {
  type        = string
  description = "The name of the user pool client"
  default     = "default-app-client"
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