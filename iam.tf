resource "aws_iam_policy" "emir_policy" {
  name        = "${var.environment}_s3_access_policy"
  path        = "/"
  description = "emir 2023 test policy"
 
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
          "*"
      ]
    }
  ]
}
EOF
}
 
resource "aws_iam_role" "emir_role" {
  name = "${var.environment}_s3_test_role"
 
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
  tags = {
    Environment = var.environment
  }
}
 
resource "aws_iam_policy_attachment" "emir_attach" {
  name       = "${var.environment}-emir-test-attachment"
  roles      = [aws_iam_role.emir_role.name]
  policy_arn = aws_iam_policy.emir_policy.arn
}
 
resource "aws_iam_instance_profile" "emir_profile" {
  name = "${var.environment}-emir_2023_ec2_profile"
  role = aws_iam_role.emir_role.name
}
