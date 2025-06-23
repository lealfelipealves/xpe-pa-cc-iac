resource "aws_iam_role" "lambda_exec" {
  name = "lambda-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "lambda_cognito" {
  role = aws_iam_role.lambda_exec.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
          "cognito-idp:ListUsers",
          "cognito-idp:AdminCreateUser",
          "cognito-idp:AdminGetUser",
          "cognito-idp:AdminSetUserPassword",
          "cognito-idp:AdminDeleteUser",
          "cognito-idp:AdminUpdateUserAttributes",
          "cognito-idp:AdminInitiateAuth"
        ],
      Resource = aws_cognito_user_pool.cpf_pool.arn
    }]
  })
}

resource "aws_iam_role_policy" "lambda_logs" {
  name = "lambda-logs-policy"
  role = aws_iam_role.lambda_exec.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}
resource "aws_lambda_function" "auth_lambda" {
  filename         = "../lambda.zip"
  function_name    = "authCpfLambda"
  handler          = "index.handler"
  runtime          = var.lambda_function_runtime
  role             = aws_iam_role.lambda_exec.arn
  source_code_hash = filebase64sha256("../lambda.zip")

  environment {
    variables = {
      USER_POOL_ID = aws_cognito_user_pool.cpf_pool.id,
      CLIENT_ID = aws_cognito_user_pool_client.cpf_client.id
    }
  }
}

resource "aws_lambda_function" "create_lambda" {
  filename         = "../lambda.zip"
  function_name    = "createCpfLambda"
  handler          = "create.handler"
  runtime          = var.lambda_function_runtime
  role             = aws_iam_role.lambda_exec.arn
  source_code_hash = filebase64sha256("../lambda.zip")

  environment {
    variables = {
      USER_POOL_ID = aws_cognito_user_pool.cpf_pool.id
    }
  }
}

resource "aws_lambda_permission" "allow_apigateway" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.auth_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.cpf_api.execution_arn}/*/*"
}

resource "aws_lambda_permission" "allow_apigateway_create" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.create_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.cpf_api.execution_arn}/*/*"
}