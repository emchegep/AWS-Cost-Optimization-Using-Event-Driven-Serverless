data "aws_iam_policy_document" "cost_optimization_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect = "Allow"
    principals {
      identifiers = ["scheduler.amazonaws.com"]
      type = "Service"
    }
  }
}

data "aws_iam_policy_document" "cost_optimization" {
  statement {
    actions = ["lambda:InvokeFunction"]
    effect = "Allow"
    resources = [aws_lambda_function.lambda.arn]
  }
}
resource "aws_iam_role" "cost_optimization" {
  assume_role_policy = data.aws_iam_policy_document.cost_optimization_assume_role.json
  name = "cost_optimization_eventbridge_role"
}

resource "aws_iam_role_policy" "cost_optimization" {
  name = "cost_optimization_eventbridge_policy"
  role = aws_iam_role.cost_optimization.id
  policy = data.aws_iam_policy_document.cost_optimization.json
}
