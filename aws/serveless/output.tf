output "cognito_user_pool_id" {
  value = aws_cognito_user_pool.cpf_pool.id
}

output "api_endpoint" {
  value = aws_apigatewayv2_api.cpf_api.api_endpoint
}

output "cognito_client_id" {
  value = aws_cognito_user_pool_client.cpf_client.id
}