# Deploy Multi-OS Applications with Docker Enterprise Edition (EE)

![Docker Logo](https://www.docker.com/sites/default/files/horizontal.png)

Docker EE is the first Containers-as-a-Service platform to offer production-grade support for the integrated management and security of both Linux and Windows Server Containers across on-premises and public cloud workloads. It is also the first platform to support both Docker Swarm and Kubernetes orchestration within a single cluster. In this lab we will learn the components of Docker EE, the options is provides for container orchestration, and then apply these concepts in a series of hands-on activities.

> [Docker Community Edition (CE)](https://www.docker.com/community-edition) is the free, open-source and community supported version of Docker that is used in Docker for Windows and Docker for Mac. While ideal for learning and PoCs, Docker EE provides the features and support needed for enterprise workloads

## Components

Docker EE is comprised of several components:

* **Docker Universal Control Plane (UCP)** is the enterprise-grade cluster management solution from Docker. You install it on-premises or in your virtual private cloud, and it helps you manage your cluster and applications through a single interface. Docker UCP has its own built-in authentication mechanism and integrates with LDAP services such as Active Directory. It also has role-based access control (RBAC), so that you can control who can access and make changes to your cluster and applications.

* **Docker Trusted Registry (DTR)** is the enterprise-grade image storage solution from Docker. You install it behind your firewall so that you can securely store and manage the Docker images you use in your applications.DTR has a built in security scanner that can be used to discover what versions of software are used in your images. It scans each layer and aggregates the results to give you a complete picture of what you are shipping as a part of your stack. Most importantly, it co-relates this information with a vulnerability database that is kept up to date through periodic updates

* **Docker EE Engine** is functionally equivalent to the corresponding Docker CE that it references. However, Docker EE also includes back-ported fixes (security-related and priority defects) from the open source. It incorporates defect fixes that you can use in environments where new features cannot be adopted as quickly for consistency and compatibility reasons

## Container Orchestration

Orchestration is the process of running a container on a cluster node The container orchestration landscape has seen signifcant development in recent years. 

<img alt="Docker Swarm Logo" src="https://d1q6f0aelx0por.cloudfront.net/product-logos/3a29d766-ea80-400c-b981-7f6c02d36fd8-swarm.png" style="width:150px;float:left;padding:10px;" />

Docker's first-party orchestrator, [Docker Swarm](https://docs.docker.com/engine/swarm/), is a polished platform for managing the end-to-end lifecycle of container solutions. Its deep integration with Docker Compose files creates an elegant approach to deploying and managing multi-container solutions across a cluster of nodes. Docker Swarm has also supported Windows worker nodes since mid-2017, making it an ideal choice for users new to orchestration or who are running .NET workloads in containers. 

<img alt="Kubernetes Logo" src="https://github.com/kubernetes/kubernetes/raw/master/logo/logo.png" style="width:150px;float:left;padding:10px;" />

The [Kubernetes](https://kubernetes.io/) project has achieved significant notoriety due to its advanced capabilities and expansive ecosystem. These advanced features come with added complexity, making Kubernetes an ideal choice for users that are comfortable with orchestration and need its more sophisticated features. Support for Windows worker nodes moved from Alpha to Beta level of support in December 2017, and is expected to reach full support in mid-018. 

Docker EE includes both Docker Swarm and Kubernetes out of the box, enabling choice for operations teams. A single cluster supports deployments from both orchestrators side-by-side, allowing disparate teams to choose the deployment approach that fits their needs.

## Lab

In this lab we will use a Docker EE cluster comprised of Windows and Linux nodes. We'll deploy both a Java web app on Linux and a multi-service application that includes both Windows and Linux components using Docker Swarm. Then we'll take a look at securing and scaling the application. Finally, we will then deploy the app using Kubernetes.

**To access the lab materials, please visit [https://github.com/dockersamples/ee-workshop](https://github.com/dockersamples/ee-workshop)**.

> This lab uses the "Play With Docker" environment, a hosted web app that makes it easy to get started with Docker EE

## Next Steps
To learn more about how [Docker Enterprise Edition](https://www.docker.com/enterprise-edition) please see the following resources:

* Try the [Docker EE Trial](https://trial.docker.com/) to get a free environment created in seconds to continue learning about EE's enterprise container platform.

* Read [Case Studies](https://www.docker.com/customers) on how customers are using Docker EE

* See how Docker EE enables no-code change modernization of your applications with the [MTA Program](https://goto.docker.com/MTAkit.html)

Thanks for participating!

<img alt="Lab Image" src="https://pbs.twimg.com/media/DRoobW4UEAAf-Vp.jpg:large" />



