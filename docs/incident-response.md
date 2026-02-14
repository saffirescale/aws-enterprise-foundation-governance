# Incident Response Plan

## Escalation Paths

1. **Detection:** Automated alerts via CloudWatch and centralized logging.
2. **Triage:** On-call engineer investigates and classifies the incident.
3. **Escalation:** If unresolved within 30 minutes, escalate to the engineering lead.
4. **Communication:** Notify stakeholders via Slack and email as per severity.

## Roles & Responsibilities

- **On-call Engineer:** Initial triage, mitigation, and communication.
- **Engineering Lead:** Escalation point, coordinates major incident response.
- **SRE/DevOps:** Supports infrastructure-level incidents.

## Runbooks

- **Service Outage:** Step-by-step guide to identify, mitigate, and restore service.
- **Data Loss:** Procedures for data recovery using backups.
- **Security Incident:** Containment, investigation, and reporting steps.

## Post-Incident

- Incident review within 48 hours.
- Document root cause and corrective actions in the incident log.
- Update runbooks and training as needed.

## Tools

- Centralized logging (CloudWatch, ELK, etc.)
- Alerting (PagerDuty, Slack)
- Documentation in `/docs`