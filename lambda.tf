resource "aws_lambda_function" "self_heal_lambda" {
  function_name = "self-heal-ec2-lambda"
  runtime       = "python3.9"
  handler       = "lambda_function.lambda_handler"
  role          = aws_iam_role.lambda_ec2_role.arn
  filename      = "lambda.zip"
  timeout       = 3
}
