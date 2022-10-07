vim my-job.yml

# restartPolicy
# can only be onFailure or Never

# backoffLimits
# limits the no. of times k8s tries to run a job
# if it doesn't run successfully the first time

# activeDeadlineSeconds
# max amount of time k8s allows a job to run
# used to terminate a job if it runs for too long

kubectl apply -f my-job.yml
kubectl get jobs
kubectl get pods
kubectl logs my-job