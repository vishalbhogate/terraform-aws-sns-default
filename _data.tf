data aws_iam_policy_document sns {
  count     = length(var.account_ids) != 0 ? 1 : 0
  policy_id = "allow-publish-clients"
  statement {
    actions   = ["SNS:Publish"]
    effect    = "Allow"
    resources = [aws_sns_topic.default.arn]
    sid       = "allow-publish-clients"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"
      values   = var.account_ids
    }
  }

}
data aws_iam_policy_document sns_all {
  count = length(var.account_ids) != 0 ? 0 : 1
  statement {
    actions = [
      "SNS:Publish"
    ]

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      aws_sns_topic.default.arn
    ]

    sid = "allow-publish-clients-stmt"
  }
}