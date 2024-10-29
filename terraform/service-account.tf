resource "kubernetes_service_account" "externalsecrets-sa" {
  depends_on = [ aws_iam_role.externalsecrets-role ]
  metadata {
    name = "externalsecrets-sa"

    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.externalsecrets-role.arn
    }
  }
}
