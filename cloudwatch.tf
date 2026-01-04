resource "aws_cloudwatch_event_rule" "ec2_stop_rule" {
  name = "ec2-stop-rule"

  event_pattern = jsonencode({
    source = ["aws.ec2"]
    detail-type = ["EC2 Instance State-change Notification"]
    detail = {
      state = ["stopped"]
    }
  })
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.ec2_stop_rule.name
  target_id = "lambda"
  arn       = aws_lambda_function.self_heal_lambda.arn
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.self_heal_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.ec2_stop_rule.arn
}
