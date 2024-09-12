output "key_id" {
  value       = try(aws_kms_key.this[0].key_id, "")
  description = "The ID of the KMS key"
}

output "key_arn" {
  value       = try(aws_kms_key.this[0].arn, "")
  description = "The ARN of the KMS key"
}