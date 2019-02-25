### cloudwatch

resource "aws_cloudwatch_event_rule" "1m" {
  name                = "trigger_bitbar_influx_logging"
  schedule_expression = "rate(1 minute)"
  is_enabled          = true
}

### cloudwatch logs

/*
data "aws_cloudwatch_log_group" "taskqueue-influxdb-metrics" {
  name = "taskqueue-influxdb-metrics"
  retention_in_days = 14
}
*/

resource "aws_cloudwatch_event_target" "lambda_trigger" {
  rule      = "${aws_cloudwatch_event_rule.1m.name}"
  target_id = "lambda_trigger"
  arn       = "${aws_lambda_function.bitbar_influx_logger.arn}"
}
