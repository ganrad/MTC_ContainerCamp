# Container Camp #

The official un-official container camp used to build out containerized applications on Azure.

We assume you have an Azure Subscription... If you don't, break out your Microsoft Account (aka LiveID, Hotmail account, etc) and pick one of these options:

* [Free $200/One Month Trial](https://azure.microsoft.com/en-us/free/) – $200 credit for use in 30 days.
* [Visual Studio Dev Essentials Program](https://www.visualstudio.com/dev-essentials/?campaign=VSBlog_AzureXamAnnoucement_VSDE) – Comes with $25 a month of Azure credit for 12 months.
* [IT Pro Cloud Essentials Program](https://www.microsoft.com/itprocloudessentials/en-US) – Also comes with $25 a month of Azure credit for 12 months.


## Setup : Create an Azure Linux Jumpbox  ##
In this setup, you will create a linux jumpbox VM in Azure using the Azure Portal, install the Azure cli, and install docker on the vm.

- Setup Step 1: [Deploy a simple Linux VM jumpbox using portal](setup/deploy-linuxjumpbox.md)
- Setup Step 2: [Login to Azure CLI](setup/xplat-cli-login.md)
- Setup Step 3: [Install Docker on the jumpbox](setup/azdockerinstall.md)
- Setup Step 4: [Clone this github repository](setup/gitclone.md)


## Module : Deploy some containers on your jumpbox ##
Starting off with containers using a Linux VM and Docker

1. [Use the Jumpbox to deploy containers](modules/docker/deploy-docker-vm.md)
2. [Create a custom container](modules/docker/buildimage.md)
3. [Instrument & Monitor your containers](modules/oms/oms4containers.md)


## Module : Configure a Windows Container Host ##
Build a Windows 2016 Server Container Host and deploy Windows containers.

* [Windows Containers on Windows Server](modules/windowscontainers/windows-containers.md)


## Module : Deploy Multi-OS Applications with Docker Enterprise Edition (EE)

Use Docker EE's capabilities for deploying and managing container deployments with both Swarm and Kubernetes.

* [Deploy Multi-OS Applications with Docker Enterprise Edition (EE)](./modules/docker-ee/README.md)


## Module : Deploy Containers to Azure aks with Kubernetes

* [Deploy Containers to Azure aks with Kubernetes](modules/kubernetes/kubernetes.md)


## Module : Deploy an Azure Container Instance

* [Deploing container to an Azure Container Instance](modules/azurecontainerinstances/aci.md)


## Module : Securing Containerized Applications
Experiment with securing containerized application by scanning for vulnerabilities, locking down the runtime environment and enforcing compliance.

* [Securing Containerized Applications](modules/security/README.md)

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

