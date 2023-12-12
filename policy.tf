resource "aws_iam_role_policy_attachment" "this" {
  role       = var.app_metadata["role_name"]
  policy_arn = data.aws_iam_policy.power-user.arn
}

data "aws_iam_policy" "power-user" {
  arn = "arn:aws:iam::aws:policy/AmazonCognitoPowerUser"
}
