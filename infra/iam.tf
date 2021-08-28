data "aws_iam_policy_document" "test_lambda_assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "test_lambda" {
  name               = "test_lambda_role"
  assume_role_policy = data.aws_iam_policy_document.test_lambda_assume.json
}
