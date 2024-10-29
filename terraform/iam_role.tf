# role to access AWS secrets manager
resource "aws_iam_role" "externalsecrets-role" {
  name = "externalsecrets_sa_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = ["sts:AssumeRoleWithWebIdentity"]
        Effect = "Allow"
        Sid    = ""
        // all services within EKS can assume this role
        Principal = {
          Federated = module.eks.oidc_provider_arn
        }
      },
    ]
  })

  inline_policy {
    name = "externalsecrets_sa_policy"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
	        // Read access to all secrets in the secrets manager
          Effect   = "Allow"
          Resource = "*"
          Action   = [
	        "secretsmanager:GetRandomPassword",
            "secretsmanager:GetResourcePolicy",
            "secretsmanager:GetSecretValue",
            "secretsmanager:DescribeSecret",
            "secretsmanager:ListSecretVersionIds",
            "secretsmanager:ListSecrets",
            "secretsmanager:BatchGetSecretValue"
	     ]
        },
      ]
    })
  }
}
