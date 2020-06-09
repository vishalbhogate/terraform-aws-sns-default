resource aws_sns_topic default {
  name = var.topic_name
}

resource aws_sns_topic_policy default {
  arn    = aws_sns_topic.default.arn
  policy = length(var.account_ids) != 0 ? data.aws_iam_policy_document.sns[0].json : data.aws_iam_policy_document.sns_all[0].json
}