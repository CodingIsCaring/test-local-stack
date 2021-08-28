provider aws {
  region = "eu-central-1"
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_requesting_account_id = true
  skip_metadata_api_check = true
  s3_force_path_style = true
  endpoints {
    iam            = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    sns            = "http://localhost:4566"
    cloudwatchlogs = "http://localhost:4566"
    s3             = "http://localhost:4566"
    sts            = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
  }
}

module "infra" {
  source = "../infra"
}