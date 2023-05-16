resource "aws_cloudformation_stack" "this" {
  name = "${var.domain_name}-ingestion-stack"

  parameters = {
    PipelineConfigurationBody = var.pipeline_configuration_body
  }

  template_body = jsonencode({

    Parameters = {
      PipelineConfigurationBody = {
        Type = "String"
      }
    }

    Resources = {
      OpenSearchIngestionPipeline = {
        Type = "AWS::OSIS::Pipeline",

        Properties = {
          PipelineName = local.pipeline_name

          LogPublishingOptions = {
            IsLoggingEnabled = var.pipeline_enable_logging
            CloudWatchLogDestination = {
              LogGroup = local.pipeline_log_group
            }
          }

          MinUnits = var.pipeline_min_units
          MaxUnits = var.pipeline_max_units

          PipelineConfigurationBody = {
            Value = {
              "Ref" = "PipelineConfigurationBody"
            }
          }
        }
      }
    }
  })

  on_failure = var.stack_on_failure

  tags = var.tags
}
