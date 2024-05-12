resource "aws_iam_policy" "billing_deny" {
  name        = "${var.project}-${var.environment}-billing-deny"
  description = "Deny billing access"
  policy      = data.aws_iam_policy_document.billing_deny.json
}

data "aws_iam_policy_document" "billing_deny" {
  statement {
    actions = [
      "aws-portal:*",
    ]
    effect    = "Deny"
    resources = ["*"]
  }
}


resource "aws_iam_policy" "ec2_rebootable" {
  name        = "${var.project}-${var.environment}-ec2-rebootable-iam-policy"
  description = "ec2 rebootable policy"
  policy      = data.aws_iam_policy_document.ec2_rebootable.json
}

data "aws_iam_policy_document" "ec2_rebootable" {
  statement {
    actions = [
      "ec2:RebootInstances",
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}

resource "aws_iam_policy" "iam_change_own_password" {
  name        = "${var.project}-${var.environment}-iam_change_own_password-iam-policy"
  description = "iam change own password policy"
  policy      = data.aws_iam_policy_document.iam_change_own_password.json
}

data "aws_iam_policy_document" "iam_change_own_password" {
  statement {
    actions = [
      "iam:ChangePassword"
    ]
    effect    = "Allow"
    resources = ["arn:aws:iam::*:user/$${aws:username}"]
  }
}


