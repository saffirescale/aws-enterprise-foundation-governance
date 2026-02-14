# RTO / RPO Strategy

## Definitions

- **RTO (Recovery Time Objective):** The maximum acceptable time to restore service after an incident.
- **RPO (Recovery Point Objective):** The maximum acceptable amount of data loss measured in time.

## Targets

- **RTO:** < 1 hour for critical infrastructure components.
- **RPO:** < 15 minutes for all persistent data.

## Backup Policies

- Automated daily backups of all stateful resources (databases, S3 buckets, etc.).
- Point-in-time recovery enabled for databases.
- Backup retention: 30 days minimum.
- Backups are encrypted and stored in a separate AWS account.

## Testing

- Quarterly backup and restore drills.
- Documented restore procedures for each environment.

## Monitoring

- Backup success/failure alerts integrated with centralized logging and alerting.
- Regular review of backup logs and restore points.