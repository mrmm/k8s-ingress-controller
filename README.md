# Usage
1. Edit your manifest files to suit your deployment
2. Generate __manifest-all.yaml__ file by : __./manifest-all.sh__ to generate the new  
3. Deploy Ingress controller by running : __kubectl create -f ./manifests-all.yaml__
> Ingress controller service is a __LoadBalancer__ type if it is for production
> Change the service to NodePort to avoid creating the LoadBalancer
