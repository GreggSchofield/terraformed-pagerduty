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

Clone this repository:

```shell
git clone https://github.com/GreggSchofield/terraformed-pagerduty
```
