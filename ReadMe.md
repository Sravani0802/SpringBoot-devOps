### Spring Boot CRUD Application on AWS EKS with RDS

#### 

#### **Project Overview**





This project demonstrates a \*\*production-ready deployment\*\* of a Spring Boot application using \*\*AWS EKS\*\*, \*\*RDS\*\*, \*\*Terraform\*\*, \*\*Docker\*\*, \*\*Jenkins\*\*, and \*\*GitHub Webhooks\*\*.



Infrastructure is provisioned using Terraform, ensuring reproducibility and scalability.



##### **Architecture**

&#x20;                      ┌──────────────────────┐

&#x20;                      │        Users                │

&#x20;                      │   (Browser / Postman)       |

&#x20;                      └─────────┬────────────┘

&#x20;                                   │ HTTP / HTTPS

&#x20;                                   ▼

&#x20;                      ┌──────────────────────┐

&#x20;                      │     ALB Ingress             │

&#x20;                      │  (kubernetes.io/ingress)    │

&#x20;                      └─────────┬────────────┘

&#x20;                                   │

&#x20;                                   ▼

&#x20;                      ┌──────────────────────┐

&#x20;                      │    EKS Cluster Pods         │

&#x20;                      │ Spring Boot Application     │

&#x20;                      │  (Container: Docker)        │

&#x20;                      └─────────┬────────────┘

&#x20;                                   │ JDBC / DB Connection

&#x20;                                   ▼

&#x20;                      ┌──────────────────┐

&#x20;                      │       AWS RDS          │

&#x20;                      │     MySQL Database     │

&#x20;                      │ Persistent Storage     │

&#x20;                      └──────────────────┘



Terraform Remote Backend:

S3 Bucket → Stores Terraform State

DynamoDB → Locks Terraform State

* **ALB Ingress**: Public entry point to the Spring Boot app.
* **EKS Pods**: Runs your Spring Boot Docker containers, auto-scalable.
* **RDS MySQL**: Persistent database with security groups allowing only EKS nodes.
* **Terraform Remote Backend**: Ensures collaboration \& prevents state corruption.

##### 

##### **Tech Stack**

* Java (Spring Boot)
* Docker
* Jenkins
* Kubernetes (EKS)
* Terraform
* AWS Services (ECR, EC2, EKS, ALB, RDS)
* MySQL





##### **Features**

* Full CRUD operations (Create, Read, Update, Delete)
* CRUD operations for `student` database.
* Spring Boot application running in \*\*AWS EKS\*\*.
* AWS RDS MySQL for persistent database storage.
* Automated CI/CD with Jenkins and GitHub integration.
* Secure and private networking between EKS pods and RDS.
* Terraform remote backend for state management.



##### **Project Structure**

.

├── terraform/              # Infrastructure provisioning (EKS, VPC, Node Groups)

├── k8s/

│   ├── deployment.yaml    # Spring Boot Deployment

│   ├── service.yaml       # ClusterIP Service

│   ├── ingress.yaml       # ALB Ingress configuration

├── Dockerfile             # App containerization

├── JenkinsFile             # CI/CD Pipeline

├── README.md



##### **Screenshots Included**



This repository contains screenshots for proof of deployment:



* EKS Cluster \& Managed Node Groups
* EC2 Instances (Worker Nodes)
* ECR Repository
* ALB Ingress Endpoint
* Kubernetes Pods \& Services
* CRUD API responses (Postman)
* RDS Database – Table and Data
* EKS Pods Running



