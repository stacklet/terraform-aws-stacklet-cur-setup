resource "aws_cur_report_definition" "stacklet_shared_cur_report" {
  report_name                = "stacklet-shared-cur-report"
  time_unit                  = "HOURLY"
  format                     = "Parquet"
  compression                = "Parquet"
  additional_schema_elements = ["RESOURCES"]
  s3_bucket                  = local.s3_bucket_name
  s3_region                  = data.aws_region.current.name
  s3_prefix                  = "cur"
  additional_artifacts       = ["ATHENA"]
  report_versioning          = "OVERWRITE_REPORT"
  depends_on                 = [aws_s3_bucket.cur_bucket]
}
