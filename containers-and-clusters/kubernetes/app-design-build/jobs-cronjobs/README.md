# Jobs and CronJobs

Jobs are objects designed to run a containerized task, successfully to completion

Cron jobs are jobs that run periodically, according to a schedule.

## YAML Parameters

Important parameters used in yaml files to define jobs and cron jobs

### restartPolicy

can only be OnFailure or Never

### backoffLimits

limits the no. of times k8s tries to run a job
if it doesn't run successfully the first time

### activeDeadlineSeconds

max amount of time k8s allows a job to run
used to terminate a job if it runs for too long

## Cron Syntax

-  [Cron syntax helper](https://cron.help/)
-  [Simple examples](https://cron.help/examples)
