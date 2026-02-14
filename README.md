# aws-enterprise-foundation-governance

## Purpose

This repository demonstrates a production-ready AWS infrastructure foundation designed for small engineering teams (5–10 engineers) that require reliability, security alignment, and predictable deployments — without maintaining a dedicated DevOps team.

The objective is not complexity.

The objective is **boring, reproducible infrastructure** that engineers can operate confidently.

---

## Problem This Solves

Early-stage teams commonly experience:

- Manual or semi-manual deployments
- Environment drift between staging and production
- Infrastructure knowledge concentrated in individuals
- Undefined recovery guarantees
- Growing enterprise or SOC2 security expectations

This template provides a repeatable baseline architecture that removes hidden operational risk and eliminates tribal knowledge.

---

## Architecture Overview

Core components:

- **GitHub (CI/CD)** — Automated deployment pipeline
- **AWS VPC (us-east-1)** — Network isolation boundary
- **Public Subnet**
  - Application Load Balancer (ALB)
- **Private Subnet**
  - ECS (Fargate Tasks)
  - RDS (PostgreSQL)
- **CloudWatch Logs & Metrics** — Centralized observability

The design intentionally prioritizes managed AWS services to minimize operational overhead.

See: `docs/architecture.png`

---

## Design Principles

- Managed AWS services over self-hosted systems
- Terraform-based Infrastructure as Code
- No click-ops
- Environment isolation (dev / staging / prod)
- Explicit rollback capability
- Least-privilege IAM roles
- Documented recovery guarantees
- Minimal long-term maintenance burden

---

## Security Considerations

- IAM roles scoped per environment
- No long-lived credentials
- Private subnet isolation for stateful services
- Centralized logging for auditability
- Automated RDS backups
- Restore procedures validated

This architecture is compatible with common SOC2 control expectations (final compliance responsibility remains with the organization and auditor).

---

## Operational Guarantees (Example Targets)

- **RTO:** < 60 minutes  
- **RPO:** < 15 minutes  
- **Log retention:** ≥ 30 days  
- **Reproducibility:** All infrastructure defined via Terraform  

These targets are adjustable based on business requirements.

---

## Deployment Flow

1. Code merged to `main`
2. GitHub Actions triggers Terraform plan
3. Staging deployment
4. Optional manual approval
5. Production deployment
6. Rollback available via previous task revision

No manual console steps required.

---

## Environment Strategy

Each environment is isolated under:

terraform/environments/
├── dev
├── staging
└── prod

## Day-1 Engineer Experience

```bash
cd terraform/environments/dev
terraform init
terraform apply
