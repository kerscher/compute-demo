resource "aws_iam_user" "packer-builds" {
  name = "packer-builds"
}

resource "aws_iam_access_key" "packer-builds" {
  user = "${aws_iam_user.packer-builds.name}"
}

data "aws_iam_policy_document" "packer-builds" {
  statement {
    effect = "Allow"

    actions = [
      "ec2:AttachVolume",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:CopyImage",
      "ec2:CreateImage",
      "ec2:CreateKeypair",
      "ec2:CreateSecurityGroup",
      "ec2:CreateSnapshot",
      "ec2:CreateTags",
      "ec2:CreateVolume",
      "ec2:DeleteKeypair",
      "ec2:DeleteSecurityGroup",
      "ec2:DeleteSnapshot",
      "ec2:DeleteVolume",
      "ec2:DeregisterImage",
      "ec2:DescribeImageAttribute",
      "ec2:DescribeImages",
      "ec2:DescribeInstances",
      "ec2:DescribeInstanceStatus",
      "ec2:DescribeRegions",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSnapshots",
      "ec2:DescribeSubnets",
      "ec2:DescribeTags",
      "ec2:DescribeVolumes",
      "ec2:DetachVolume",
      "ec2:GetPasswordData",
      "ec2:ModifyImageAttribute",
      "ec2:ModifyInstanceAttribute",
      "ec2:ModifySnapshotAttribute",
      "ec2:RegisterImage",
      "ec2:RunInstances",
      "ec2:StopInstances",
      "ec2:TerminateInstances",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "packer-builds" {
  name   = "packer-builds_minimal_permissions"
  user   = "${aws_iam_user.packer-builds.name}"
  policy = "${data.aws_iam_policy_document.packer-builds.json}"
}

output "packer-builds" {
  sensitive = true

  value {
    "user"       = "${aws_iam_access_key.packer-builds.user}"
    "access-key" = "${aws_iam_access_key.packer-builds.id}"
    "secret"     = "${aws_iam_access_key.packer-builds.secret}"
  }
}
