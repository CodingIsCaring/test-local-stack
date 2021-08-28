module "lambda-python-archive" {
  source      = "rojopolis/lambda-python-archive/aws"
  version     = "0.1.6"
  src_dir     = "${path.module}/python"
  output_path = "${path.module}/test_lambda.zip"
}


resource "aws_lambda_function" "test_lambda" {
  function_name = "test_lambda"
  filename      = "test_lambda.zip"
  role          = aws_iam_role.test_lambda.arn
  handler       = "test_lambda.py"

  source_code_hash = module.lambda-python-archive.source_code_hash

  runtime = "python3.9"

  environment {
    variables = {
      foo = "bar"
    }
  }
}
