resource "aws_scheduler_schedule" "cost-optimization" {
  schedule_expression = "rate(10 minutes)"
  name = "my_hourly_schedule"

  flexible_time_window {
    mode = "OFF"
  }

  target {
    arn      = aws_lambda_function.lambda.arn
    role_arn = aws_iam_role.cost_optimization.arn
  }
}
