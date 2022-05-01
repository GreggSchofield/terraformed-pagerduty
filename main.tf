terraform {

  # The configuration for the `remote` backend.
  backend "remote" {
    # The name of your Terraform Cloud organisation.
    organization = "example-organisation"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "example-workspace"
    }
  }

  required_providers {
    pagerduty = {
      source  = "PagerDuty/pagerduty"
      version = "2.4.1"
    }
  }
}
