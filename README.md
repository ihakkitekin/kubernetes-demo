First enable kubernetes from docker.

## Dashboard
    $ kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml

## Create User
    apiVersion: v1
    kind: ServiceAccount
    metadata:
      name: admin-user
      namespace: kubernetes-dashboard

## Create Role Bindings
    apiVersion: rbac.authorization.k8s.io/v1
    kind: ClusterRoleBinding
    metadata:
      name: admin-user
    roleRef:
      apiGroup: rbac.authorization.k8s.io
      kind: ClusterRole
      name: cluster-admin
    subjects:
    - kind: ServiceAccount
      name: admin-user
      namespace: kubernetes-dashboard

## Get User Token
    $ kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | sls admin-user | ForEach-Object { $_ -Split '\s+' } | Select -First 1)

## Ingress
    $ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.35.0/deploy/static/provider/baremetal/deploy.yaml

## Kubeless

### Install
    $ export RELEASE=$(curl -s https://api.github.com/repos/kubeless/kubeless/releases/latest | grep tag_name | cut -d '"' -f 4)

    $ kubectl create ns kubeless

    $ kubectl create -f https://github.com/kubeless/kubeless/releases/download/$RELEASE/kubeless-$RELEASE.yaml

### Deploy a function
    $ kubeless.exe function deploy echo --runtime nodejs10 \
            --cpu 0.5 \
            --memory 500Mi \
            --servicePort 32002 \
            --timeout 5 \
            --namespace local \
            --handler index.echo \
            --from-file index.js

### Create http trigger
    $ kubeless trigger http create echo --function-name echo --namespace local --path echo --hostname example.com


### Describe Ingress Controller 
    $ kubectl describe svc ingress-nginx-controller -n=ingress-nginx

    ...
    NodePort:                 http  31496/TCP
    ...


### Call the Function
With any http library call <code>http://localhost:31496/echo</code> with header '<code>Host: example.com</code>'