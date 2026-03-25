#### **Project Overview**



This project demonstrates deploying a Spring Boot CRUD application on AWS Cloud using modern DevOps practices. The application is containerized with Docker, deployed on Kubernetes (EKS), and exposed using an Application Load Balancer (ALB) Ingress Controller.



Infrastructure is provisioned using Terraform, ensuring reproducibility and scalability.



##### **Architecture**

* Spring Boot Application (CRUD APIs)
* Docker for containerization
* Amazon ECR for image storage
* Amazon EKS for Kubernetes cluster
* Managed Node Groups for worker nodes
* AWS ALB Ingress Controller for external access
* Ephemeral MySQL Database deployed inside Kubernetes
* Terraform for infrastructure provisioning



**Tech Stack**
---

* Java (Spring Boot)
* Docker
* Jenkins
* Kubernetes (EKS)
* Terraform
* AWS Services (ECR, EC2, EKS, ALB)
* MySQL





##### **Features**

* Full CRUD operations (Create, Read, Update, Delete)
* Containerized microservice deployment
* Scalable Kubernetes infrastructure
* External access via ALB Ingress
* Infrastructure as Code using Terraform
* Lightweight ephemeral database setup (for demo purposes)



##### **Project Structure**

.

├── terraform/              # Infrastructure provisioning (EKS, VPC, Node Groups)

├── k8s/

│   ├── deployment.yaml    # Spring Boot Deployment

│   ├── service.yaml       # ClusterIP Service

│   ├── ingress.yaml       # ALB Ingress configuration

│   ├── mysql.yaml         # MySQL Deployment \& Service

├── Dockerfile             # App containerization

├── JenkinsFile             # CI/CD Pipeline

├── README.md



##### **Screenshots Included**



This repository contains screenshots for proof of deployment:



* &#x20;EKS Cluster \& Managed Node Groups
* &#x20;EC2 Instances (Worker Nodes)
* &#x20;ECR Repository
* &#x20;ALB Ingress Endpoint
* &#x20;Kubernetes Pods \& Services
* &#x20;CRUD API responses (Postman)







