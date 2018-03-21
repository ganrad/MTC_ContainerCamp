## Deploy Containers to Azure AKS with Kubernetes

In this lab we will create the new managed Azure Kubernetes Container Service (AKS). 

The assumes you are using the jumpbox created in the setup portion of this workshop. If you have not already set it up, refer to [Setup](setup/deploy-linuxjumpbox.md), follow the steps, then return here.

Next, we will ensure we have correct version of azure cli to perform necessary support for AKS. Then we will install `kubectl`, the CLI for managing the Kubernetes cluster. Using kubectl, we will deploy a sample application. Finally we will explore the `Kubernetes Dashboard`, a general-purpose monitoring and operations tool for Kubernetes clusters.

## Task 1: Login to Azure with Azure cli

If you not already done so, follow instructions from [Azure cli login](setup/xplat-cli-login.md) to install Azure cli and login and set to your desired Azure Subscrition where you want to deploy the aks cluster.

## Task 2: Login to Azure with Azure cli

Pre read [Enabling AKS in your Azure subscription](https://blogs.msdn.microsoft.com/alimaz/2017/10/24/enabling-aks-in-your-azure-subscription/)
    

1. Ensure you have correct version of Azure cli. Check by following command to ensure the Azure Cli is at least **2.0.20+**

    ```
    az -v
    ```
2. If your cli version is less than above mentioned version then follow below steps to upgrade your cli

    ```
    apt-get upgrade azure-cli
    ```
    Above steps will take some time. Once update complete, once again check the version. If your cli version is still not the recomended version, then try below two commands

    ```
    sudo apt-get update
    sudo apt-get upgrade
    ```

    Test by trying below command to ensure you have support for aks

    ```
    az aks
    ```

3. Next we need to ensure that the Resoure Provider for the new AKS service is registered for your subscription. Above referenced pre-read blog, you can see the powershell approach to enable, however here there is alterative quick approach check via the azure.portal.com. Follow below steps to valdiate and register if not already registered.

Portal>Subscriptions>Your Subscription>Resource providers>Microsoft.ContainerService> (Ensure registered)

## Task 3: Create AKS Cluster
1. Create a new resource group for your AKS to reside in.  Please refer to this [link](https://github.com/Azure/AKS/blob/master/preview_regions.md) to get the latest on region availability. 

```bash
    RG='AKSWorkshopRG'
    LOCATION='EastUS'
    az group create --name=$RG --location=$LOCATION
```        

2.  Create your AKS cluster using Kubernetes with the following command:
    ```bash
    CLUSTER=akscluster
    DNSPREFIX=abckube
    az aks create -g $RG -n $CLUSTER --dns-name-prefix=$DNSPREFIX --generate-ssh-keys
    ```
## Task 4: Install kubectl
Kubectl is the command line tool for administering your AKS Kubernetes cluster.  

In the BASH Shell, the default location for installing kubectl is /usr/local/bin/kubectl.  This location is not typically available without changing the permissions or running the command using the sudo preference.  For this lab, we will place the kubectl file into another direcotry within the current user's file structure.  This directory must exist prior to installing the cli.

1. Create the directory for kubectl  (This may show an error if the directory already exists.  This is not a problem.)
    ```none
    mkdir bin
    ```

2. Install the *kubectl* tool into the new directory with the following command:

    ```none
    az aks install-cli --install-location=bin/kubectl
    ```

    The kubectl command will install in the aztools directory.  Note that the text after / will be the name of the file as stored in the aztools directory.  This means if it is mistyped, as in kubctl, this is how you will need to refer to the 'kubectl' commands.  

3. Now that we have the installation and path mapped, validate that *kubectl* has been successfully installed by running:
    ```none
    kubectl version
    ```

## Task 5: Connect to the Cluster with *kubectl*
1. Run the following commadn to download the client credentials needed to access the Kubernetes cluster:

    ```bash
    az aks get-credentials --resource-group=$RG --name=$CLUSTER
    ```

## Task 6: Deploy the application to Kubernetes
In this task, you will deploy the readinglist application stack to Kubernetes cluster. In kubernetes a group of one or more containers run as a pod. Pods can also have shared storage for the containers running in the pod. 

At the end of this task you will have a total of 3 pods. Two for the app tier and one for MySQL. The app tier pods will have both `ReadingList web app` and `Recommendation service`. There will be a total of 5 containers across 3 pods. 

If you have not already done so (back in setup), clone the repository containing this tutorial with the following command:
    ```bash
    git clone https://github.com/Microsoft/MTC_ContainerCamp
    ```
1. Make the directory containing the deployment *.yaml* files your current directory: 
```bash
cd MTC_ContainerCamp/modules/kubernetes/src/deploy
```
2. Deploy a Kubernetes pod containing a mysql database using the following command:
    ```bash
    kubectl create -f mysql-deployment.yaml
    ```
3. Deploy a Kubernetes service for the mysql database using the following command:
    ```
    kubectl create -f mysql-service.yaml
    ```
4. Deploy the web UX and web service of the application using the following command:
    ```none
    kubectl create -f readinglist-deployment.yaml
    ```
5. Expose the web UX as a public service by running the following command:
    ```none
    kubectl create -f readinglist-service.yaml
    ```
6. Monitor the service creation and find the public IP address when the load balancer is configured by running the following command:
    ```none
    kubectl get svc web
    ```
    You will have to execute the command several times while you wait for the load balancer to be properly configured.  The IP address will change from *pending* to a valid IP address when finished.

7. Access the Reading List application by opening your browser to http://<PublicIP>/

8. You can check the number of pods running in your cluster with the following command:
    ```none
    kubectl get pods
    ```
9. You can scale the number of pods used by your application at any time. To scale the number of pods for the web tier of the Reading List application, run the following command:
    ```none
    kubectl scale deployment/web --replicas=3
    ```
10. Check the number of pods now being used by the application by running this command:
    ```none
    kubectl get pods
    ```
13. Determine the number of web tier pod endpoints being load balanced by the app service tier with the following command:
    ```none
    kubectl get ep web
    ```

## Continue
Next, we'll explore visualization tools for Kubernetes.
Continue with the [next section](modules/kuernetes/kubeviz.md)

<!--   Commenting out dashboard until we can solve the remote proxy problem
## Task 7: Explore the Kubernetes cluster with the Dashboard
The Kubernetes Dashboard is web interface that provides general-purpose monitoring and operations for Kubernetes clusters.  You can access this dashboard from your local machine via a proxy tunnel created by the *kubectl* tool.

1. To open a proxy tunnel to the Kubernetes Dashboard, run the following command:
    ```none
    kubectl proxy -p 8001
    ```
2. Open the browser on you machine and navigate to [http://localhost:8001/ui](http://localhost:8001/ui)

3. You can also try:
    ```
     az aks browse -n [Cluster Name] -g [Resource Group] 
    ```


## Managing your k8s cluseter using Cabin app ##
 Follow this blog post to install and configure Cabin to manage your k8s cluster on your iOS or Android device:
 [Managing Azure Kubernetes Managed Service via Cabin app](https://blogs.msdn.microsoft.com/alimaz/2017/10/31/managing-azure-kubernetes-managed-service-aks-using-cabin-app/)
-->