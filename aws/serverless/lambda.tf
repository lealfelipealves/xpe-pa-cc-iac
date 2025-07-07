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
      Resource = aws_cognito_user_pool.this.arn
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

resource "aws_lambda_function" "auth" {
  filename         = "./lambda.zip"
  function_name    = "auth-cpf"
  handler          = "auth.handler"
  runtime          = var.lambda_function_runtime
  role             = aws_iam_role.lambda_exec.arn
  source_code_hash = filebase64sha256("./lambda.zip")

  environment {
    variables = {
      USER_POOL_ID = aws_cognito_user_pool.this.id,
      CLIENT_ID    = aws_cognito_user_pool_client.this.id
    }
  }
}

resource "aws_lambda_function" "create" {
  filename         = "./lambda.zip"
  function_name    = "create-cpf"
  handler          = "create.handler"
  runtime          = var.lambda_function_runtime
  role             = aws_iam_role.lambda_exec.arn
  source_code_hash = filebase64sha256("./lambda.zip")

  environment {
    variables = {
      USER_POOL_ID = aws_cognito_user_pool.this.id
    }
  }
}

