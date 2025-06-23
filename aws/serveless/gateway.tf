resource "aws_apigatewayv2_api" "this" {
  name          = "cpf-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id                  = aws_apigatewayv2_api.cpf_api.id
  integration_type        = "AWS_PROXY"
  integration_uri         = aws_lambda_function.auth_lambda.invoke_arn
  integration_method      = "POST"
  payload_format_version  = "2.0"
}

resource "aws_apigatewayv2_integration" "lambda_integration_create" {
  api_id                  = aws_apigatewayv2_api.cpf_api.id
  integration_type        = "AWS_PROXY"
  integration_uri         = aws_lambda_function.create_lambda.invoke_arn
  integration_method      = "POST"
  payload_format_version  = "2.0"
}

resource "aws_apigatewayv2_route" "cpf_route" {
  api_id    = aws_apigatewayv2_api.cpf_api.id
  route_key = "POST /auth"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

resource "aws_apigatewayv2_route" "cpf_route_create" {
  api_id    = aws_apigatewayv2_api.cpf_api.id
  route_key = "POST /create"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration_create.id}"
}

resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.cpf_api.id
  name        = "$default"
  auto_deploy = true
}