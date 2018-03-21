# Explore Kubernetes Visualizations

## Task 1:  Simple Kubernetes Visualizer
In this task, you will run a simple visualization tool to see nodes & pods deployed on your cluster.

1. First, we need to open port 8001 as this will be used for the web visualizers.  From your jumpbox command line, run: *(substituting the name of your jumpbox & the resource group)*
```
az vm open-port --port 8001 --name jumpbox --resource-group jumpboxrg
```

2.  Next, we need to start the dashboard proxy
```bash
kubectl proxy --www=/home/adminuser/MTC_ContainerCamp/Modules/kubernetes/src/viz --www-prefix=/viz/ --accept-hosts='' --address='0.0.0.0' &
```
*Note that the trailing '&' runs the command in the background.  We will terminate it at the end of this exercise.*

3. Find the public ip address of the jumpbox
```
az vm list-ip-addresses --name jumpbox --resource-group jumpboxrg
```

4. From your browser, open up a window and go to the dashboard [http://<IP_address_of_jumpbox>:8001/viz/](http://IP_address_of_jumpbox:8001/viz/)

In the dashboard, you will see a simple graphical representation of the cluster nodes, deployments, and pods.

5. Try scaling the deployment and watch the dashboard.  From your shell, enter:
```
kubectl scale deployment/web --replicas=1
``` 
<!--
6.  We're done with this part, so kill off the dashboard proxy:
```
kill %1
```
-->

## Task 2:  Explore the Kubernetes cluster with the full Dashboard

The Kubernetes Dashboard is web interface that provides general-purpose monitoring and operations for Kubernetes clusters.  We can access the dashboard using the same proxy that we enabled in step 1.

2. Open the browser on your machine and navigate to [http://<IP_address_of_jumpbox>:8001/ui/](http://IP_address_of_jumpbox:8001/ui/)

## Task 3: (Optional) Managing your k8s cluster using Cabin app ##
 Follow this blog post to install and configure Cabin to manage your k8s cluster on your iOS or Android device:
 [Managing Azure Kubernetes Managed Service via Cabin app](https://blogs.msdn.microsoft.com/alimaz/2017/10/31/managing-azure-kubernetes-managed-service-aks-using-cabin-app/)
