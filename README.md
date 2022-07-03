# gke-rbac

## Tools
```
gcloud version
Google Cloud SDK 392.0.0

terraform version
Terraform v1.1.9
```
## Prepare environment

```
export PROJECT_ID=<YourGCPProjID>
export GKE_ZONE=asia-southeast1-a
export GKE_REGION=asia-southeast1

gcloud auth login
gcloud auth application-default login
gcloud config set project ${PROJECT_ID}
```

## Create Cluster

```
gcloud container clusters create gke-rbac \
    --project ${PROJECT_ID} \
    --zone ${GKE_ZONE} \
    --release-channel "rapid" \
    --workload-pool "${PROJECT_ID}.svc.id.goog" \
    --scopes=gke-default,cloud-platform
```

## Fetch Credentials for the cluster
```
gcloud container clusters get-credentials gke-rbac \
    --project ${PROJECT_ID} \
    --zone ${GKE_ZONE}
```

## Terraform (Update main.tf with gcp project id & existing users email)

```
terraform init
terraform apply

Plan: 22 to add, 0 to change, 0 to destroy.

```
## Verify

+ team-a user trying to run pod in namespace team-a
```
kubectl run -n team-a nginx --image=nginx --restart=Never

pod/nginx created
```

+ team-a user trying to run pod in namespace team-b
```
kubectl run -n team-b nginx --image=nginx --restart=Never

Error from server (Forbidden): pods is forbidden: User "XXXX@gmail.com" cannot create resource "pods" in API group "" in the namespace "team-b": requires one of ["container.pods.create"] permission(s).

```

## Cleanup
```
terraform destroy
Plan: 0 to add, 0 to change, 22 to destroy.

```