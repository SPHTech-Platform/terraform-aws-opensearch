output "pipeline_name" {
  description = "Name of the ingestion pipeline"
  value       = local.pipeline_name
}

output "pipeline_arn" {
  description = "ARN of the ingestion pipeline"
  value       = awscc_osis_pipeline.this.pipeline_arn
}

output "ingest_endpoint_urls" {
  description = "The ingestion endpoints for the pipeline that you can send data to"
  value       = awscc_osis_pipeline.this.ingest_endpoint_urls
}