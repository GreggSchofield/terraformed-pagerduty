# terraformed-pagerduty

[PagerDuty](https://www.pagerduty.com/) is a SaaS for agile incident management that enables Software, DevOps and
Site-Reliability Engineers to respond in near real-time to issues with critical software systems. Whilst it is possible
for PagerDuty to be configured end-to-end using the console alone, for anything other than trivial configurations,
[infrastructure as code/configuration](https://en.wikipedia.org/wiki/Infrastructure_as_code) (IaC) techniques should be
utilised to gain speed, consistency and accountability to name but a few.

[Terraform](https://www.terraform.io/) is an infrastructure-as-code tool created by
[HashiCorp](https://www.hashicorp.com/) that will be used to define and manage our PagerDuty resources using Terraform
(.tf) files. In line with Hashicorp recommendations for production workloads,
[Terraform Cloud](https://cloud.hashicorp.com/products/terraform) is utilised as a remote backend. Advantages of using
a remote backend (and in particular Terraform Cloud) include:

* _Workspaces_ allow for project granularity and avoids monolithic Terraform projects
* State file
  * Encryption at rest and in transit (enforced with TLS)
  * Concurrent modification control
  * Versioning and auditability
* Stable environment for long-running `terraform apply` processes (compared to local execution)
* Secure variable, API token and environment variable storage
* Granular [organisational and workspace permissions](https://www.terraform.io/cloud-docs/workspaces/settings/access) to 
  enforce the [principal of least privilege](https://en.wikipedia.org/wiki/Principle_of_least_privilege)


## Prerequisites

All the following are required to use this repository properly:

- Sign-up for a [free PagerDuty account](https://www.pagerduty.com/sign-up-free/)
- Terraform v1.x.y installed locally (follow the
  [Hashicorp Learn tutorial](https://learn.hashicorp.com/tutorials/terraform/install-cli)) for a manual installation
  (from source), OS X, Windows (via Chocolatey) or Linux
- A [Terraform Cloud account](https://app.terraform.io/signup/account)

## Getting Started

Clone this repository to take a closer look at the internals:

```shell
git clone https://github.com/GreggSchofield/terraformed-pagerduty
```

When you are happy you want to proceed, fork this repository.

## In Terraform Cloud

Within your Terraform Cloud account create an
[organisation](https://www.terraform.io/cloud-docs/users-teams-organizations/organizations) and within this, a
[workspace](https://www.terraform.io/language/state/workspaces). These are named _example-organisation_ and
_example-workspace_ respectively and should be re-named as suitable. Whilst creating the workspace ensure to select the
**API-driven workflow** type. This can be confusing since there is a **Version control workflow** type available but our
workflow will eventually trigger the remote backend via an execution of `terraform apply` within the pipeline itself.

Next, create a PagerDuty _v2 authorisation token_ and store this as a repository-scoped GitHub Actions secret with the
key `PAGERDUTY_TOKEN`.

Finally, create a _Team API token_ within Terraform Cloud and then store this as a repository-scoped GitHub Actions
secret with the key `TERRAFORM_CLOUD_API_TOKEN`.
