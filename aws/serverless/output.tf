output "cognito_user_pool_id" {
  value = aws_cognito_user_pool.this.id
}

output "api_endpoint" {
  value = aws_apigatewayv2_api.this.api_endpoint
}

output "cognito_client_id" {
  value = aws_cognito_user_pool_client.this.id
}