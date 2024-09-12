variable "create" {
  description = "whether to create a new KMS key"
  type        = bool
  default     = "true" 
} 

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC in which the EKS cluster will be created."
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster."
  type        = list(string)
}

variable "cluster_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster."
  type        = string
}

variable "cluster_security_group_tags" {
  description = "Tags for the EKS cluster security groups."
  type        = map(string)
}

variable "cluster_encryption_policy_tags" {
  description = "Tags for the KMS keys used for encryption."
  type        = map(string)
}

variable "cluster_encryption_config" {
  description = "Encryption configuration for the cluster."
  type = object({
    provider_key_arn = string
  })
}

variable "create_external" {
  description = "Whether to create an external KMS key."
  type        = bool
  default     = false
}

variable "create_replica" {
  description = "Whether to create a KMS key replica."
  type        = bool
  default     = false
}

variable "create_replica_external" {
  description = "Whether to create an external KMS key replica."
  type        = bool
  default     = false
}

variable "bypass_policy_lockout_safety_check" {
  description = "Whether to bypass the policy lockout safety check."
  type        = bool
  default     = false
}

variable "customer_master_key_spec" {
  description = "The customer master key specification."
  type        = string
}

variable "custom_key_store_id" {
  description = "The ID of the custom key store."
  type        = string
  default     = null
}

variable "deletion_window_in_days" {
  description = "The number of days after which the key is deleted."
  type        = number
  default     = 30
}

variable "description" {
  description = "A description of the KMS key."
  type        = string
  default     = ""
}

variable "enable_key_rotation" {
  description = "Whether to enable key rotation."
  type        = bool
  default     = true
}

variable "is_enabled" {
  description = "Whether the KMS key is enabled."
  type        = bool
  default     = true
}

variable "key_usage" {
  description = "The intended use of the KMS key."
  type        = string
}

variable "multi_region" {
  description = "Whether the KMS key is a multi-region key."
  type        = bool
  default     = false
}


variable "rotation_period_in_days" {
  description = "The rotation period for the KMS key."
  type        = number
  default     = 365
}

variable "tags" {
  description = "Tags to apply to the KMS key."
  type        = map(string)
  default     = {}
}

variable "aliases" {
  description = "A list of aliases for the KMS key."
  type = list(object({
    name = string
  }))
  default = []
}

variable "aliases_use_name_prefix" {
  description = "Whether to use a prefix for aliases."
  type        = bool
  default     = false
}

variable "computed_aliases" {
  description = "Computed aliases for the KMS key."
  type = map(object({
    name = string
  }))
  default = {}
}

variable "grants" {
  description = "Grants to apply to the KMS key."
  type = list(object({
    name              = string
    grantee_principal = string
    operations        = list(string)
    constraints       = map(string)
    retiring_principal = string
    grant_creation_tokens = list(string)
    retire_on_delete  = bool
  }))
  default = []
}

variable "key_owners" {
  description = "The IAM users or roles that are key owners."
  type        = list(string)
  default     = []
}

variable "key_administrators" {
  description = "The IAM users or roles that are key administrators."
  type        = list(string)
  default     = []
}

variable "key_users" {
  description = "The IAM users or roles that are allowed to use the key."
  type        = list(string)
  default     = []
}

variable "key_service_users" {
  description = "The IAM roles that are allowed to use the key for service integrations."
  type        = list(string)
  default     = []
}

variable "key_service_roles_for_autoscaling" {
  description = "IAM roles used for autoscaling that need access to the key."
  type        = list(string)
  default     = []
}

variable "key_symmetric_encryption_users" {
  description = "IAM users or roles that can perform symmetric encryption with the key."
  type        = list(string)
  default     = []
}

variable "key_hmac_users" {
  description = "IAM users or roles that can use HMAC keys."
  type        = list(string)
  default     = []
}

variable "key_asymmetric_public_encryption_users" {
  description = "IAM users or roles that can use asymmetric public encryption keys."
  type        = list(string)
  default     = []
}

variable "key_asymmetric_sign_verify_users" {
  description = "IAM users or roles that can use asymmetric signing/verification keys."
  type        = list(string)
  default     = []
}

variable "enable_route53_dnssec" {
  description = "Whether to enable Route 53 DNSSEC."
  type        = bool
  default     = false
}

variable "route53_dnssec_sources" {
  description = "Sources for Route 53 DNSSEC."
  type = list(object({
    account_ids       = list(string)
    hosted_zone_arn   = string
  }))
  default = []
}

variable "key_statements" {
  description = "Additional policy statements for the KMS key."
  type = list(object({
    sid           = string
    actions       = list(string)
    not_actions   = list(string)
    effect        = string
    resources     = list(string)
    not_resources = list(string)
    principals    = list(object({
      type        = string
      identifiers = list(string)
    }))
    not_principals = list(object({
      type        = string
      identifiers = list(string)
    }))
    conditions = list(object({
      test     = string
      values   = list(string)
      variable = string
    }))
  }))
  default = []
}

variable "source_policy_documents" {
  description = "List of source policy documents to include in the policy."
  type        = list(string)
  default     = []
}

variable "override_policy_documents" {
  description = "List of policy documents to override the source policies."
  type        = list(string)
  default     = []
}

variable "partition" {
  description = "The AWS partition (e.g., aws, aws-cn, aws-us-gov)."
  type        = string
}

variable "enable_default_policy" {
  description = "Whether to enable the default policy."
  type        = bool
  default     = false
}

variable "account_id" {
  description = "The AWS account ID."
  type        = string
}

variable "primary_key_arn" {
  description = "primary key arn"
  type        = string
}

variable "key_material_base64" {
  description = "Base64-encoded key material for external keys."
  type        = string
  default     = ""
}

variable "policy" {
  description = "The policy document for the KMS key."
  type        = string
  default     = ""
}

variable "primary_external_key_arn" {
  description = "ARN of the primary external key for replica external keys."
  type        = string
  default     = ""
}

variable "valid_to" {
  description = "The end date for the validity of the external key."
  type        = string
  default     = ""
}