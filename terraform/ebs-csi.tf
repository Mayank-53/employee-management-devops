##############################
# EBS CSI Driver IAM Role
##############################

data "aws_iam_policy_document" "ebs_csi_assume_role" {

  statement {

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    effect = "Allow"

    principals {

      type = "Federated"

      identifiers = [
        module.eks.oidc_provider_arn
      ]

    }

    condition {

      test = "StringEquals"

      variable = "${replace(module.eks.cluster_oidc_issuer_url, "https://", "")}:sub"

      values = [
        "system:serviceaccount:kube-system:ebs-csi-controller-sa"
      ]

    }

  }

}

resource "aws_iam_role" "ebs_csi" {

  name = "employee-management-ebs-csi-role"

  assume_role_policy = data.aws_iam_policy_document.ebs_csi_assume_role.json

}

resource "aws_iam_role_policy_attachment" "ebs_csi" {

  role = aws_iam_role.ebs_csi.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"

}
