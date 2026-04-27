resource "aws_codebuild_project" "static_site_build" {
  name         = "static-site-build"
  service_role = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:5.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = <<BUILDSPEC
version: 0.2

phases:
  build:
    commands:
      - echo "Building static site..."
      - ls -al
artifacts:
  files:
    - '**/*'
BUILDSPEC
  }
}
