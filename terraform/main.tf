provider "aws" {
  region = "us-east-1"
}

resource "aws_lambda_function" "alert_handler" {
  function_name = "alert-handler"
  filename      = "../lambda/alert_handler.py"
  handler       = "alert_handler.lambda_handler"
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_exec.arn
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow",
      Sid    = ""
    }]
  })
}
