#### **AI-Driven Self-Healing Kubernetes Monitoring Platform on AWS**

##### 

##### **Overview**



This project implements an end-to-end cloud-native reliability platform on Amazon EKS that combines:



* Infrastructure as Code (Terraform)
* CI/CD (Jenkins + ArgoCD)
* Kubernetes auto-scaling (HPA)
* Observability (Prometheus + Grafana)
* Centralized logging (CloudWatch + Fluent Bit)
* AI-driven log analysis (Python)
* Automated self-healing actions (Kubernetes remediation)



The platform monitors application health, detects anomalies, and automatically triggers recovery actions such as restarting deployments, scaling workloads, or rolling back releases.



##### **Architecture**



&#x20;                        +------------------+

&#x20;                        |   Developer      |

&#x20;                        +------------------+

&#x20;                                 |

&#x20;                                 v

&#x20;                        +------------------+

&#x20;                        |      GitHub      |

&#x20;                        +------------------+

&#x20;                                 |

&#x20;                                 v

&#x20;                        +------------------+

&#x20;                        | Jenkins (CI)     |

&#x20;                        | Build + Push     |

&#x20;                        +------------------+

&#x20;                                 |

&#x20;                                 v

&#x20;                        +------------------+

&#x20;                        | Amazon ECR       |

&#x20;                        +------------------+

&#x20;                                 |

&#x20;                                 v

&#x20;                        +------------------+

&#x20;                        | ArgoCD (GitOps)  |

&#x20;                        +------------------+

&#x20;                                 |

&#x20;                                 v

&#x20;               -----------------------------------------

&#x20;               |            Amazon EKS Cluster          |

&#x20;               |---------------------------------------|

&#x20;               | Spring Boot App (Pods)                |

&#x20;               | HPA (Auto Scaling)                    |

&#x20;               -----------------------------------------

&#x20;                        |                    |

&#x20;                        |                    |

&#x20;                        v                    v

&#x20;             +----------------+   +----------------------+

&#x20;             | Prometheus      |   | Fluent Bit           |

&#x20;             | Metrics         |   | Log Forwarding       |

&#x20;             +----------------+   +----------------------+

&#x20;                      |                     |

&#x20;                      v                     v

&#x20;             +----------------+   +----------------------+

&#x20;             | Grafana         |   | CloudWatch Logs      |

&#x20;             | Dashboards      |   | Container Insights   |

&#x20;             +----------------+   +----------------------+

&#x20;                                             |

&#x20;                                             v

&#x20;                                  +----------------------+

&#x20;                                  | Python AI Engine      |

&#x20;                                  | Log Analysis          |

&#x20;                                  | Decision Engine       |

&#x20;                                  +----------------------+

&#x20;                                             |

&#x20;                                             v

&#x20;                                  +----------------------+

&#x20;                                  | Auto-Healing Actions  |

&#x20;                                  | Restart               |

&#x20;                                  | Scale                 |

&#x20;                                  | Rollback              |

&#x20;                                  +----------------------+





##### Features

* Infrastructure Automation
* Provisioned AWS infrastructure using Terraform:
* VPC
* EKS Cluster
* Node Groups
* ALB
* IAM Roles
* CI/CD Pipeline



Implemented automated delivery pipeline:



GitHub → Jenkins → ECR → ArgoCD → EKS



###### **Capabilities**:



* Automated container builds
* Image push to ECR
* GitOps deployment with ArgoCD
* Kubernetes application delivery
* Kubernetes Auto Scaling



**Implemented Horizontal Pod Autoscaler (HPA):**



* CPU-based scaling
* Dynamic replica adjustment
* Scale-up / scale-down behavior
* HPA metrics monitoring
* Observability Stack



**Monitoring with:**



* Prometheus
* Grafana



**Tracked:**



* CPU usage
* Memory usage
* Pod health
* Replica scaling
* Node metrics
* Restart counts
* Centralized Logging



**Integrated:**



* Fluent Bit
* Amazon CloudWatch



**Collected:**



* Container logs
* Kubernetes application logs
* Runtime events
* AI-Driven Log Analyzer



Python engine performs:



* CloudWatch log analysis
* Prometheus metric checks
* Restart anomaly detection
* Crash pattern detection



**Example logic:**



If restart\_count > threshold:

&#x20;  restart deployment



If CrashLoopBackOff detected:

&#x20;  trigger healing



If CPU threshold exceeded:

&#x20;  scale deployment



Auto-Healing Actions



**Automated remediation:**



kubectl rollout restart deployment

kubectl scale deployment

kubectl rollout undo deployment





##### **Tech Stack**

* Cloud
* AWS
* Amazon EKS
* Amazon ECR
* CloudWatch
* DevOps
* Terraform
* Jenkins
* ArgoCD
* Docker
* Kubernetes
* Observability
* Prometheus
* Grafana
* Fluent Bit
* Application
* Java
* Spring Boot
* Automation
* Python
* Boto3





##### Project Structure

.

├── Terraform/

├── JenkinsFile

├── Screenshots

├── k8s/

│   ├── deployment.yaml

│   ├── service.yaml

│   ├── ingress.yaml

│   └── hpa.yaml

│

├── AI-Healing/

│   ├── analyzer.py

│   ├── decision\_engine.py

│   ├── main.py

│   └── config.py

│

└── README.md







System validated using:



Checking CloudWatch logs ...

Issues found : \[]

Checking Prometheus metrics ...

Restart count: 48



Too many restarts -> restart deployment



Running:

kubectl rollout restart deployment springboot-app -n default



deployment.apps/springboot-app restarted



##### **Monitoring Dashboards**



**Grafana dashboards include:**



Kubernetes Cluster Metrics

CPU and Memory Monitoring

HPA Replica Metrics

Pod Health

Node Exporter Metrics

Future Improvements



**Planned enhancements:**



Prometheus AlertManager integration

Slack/email alerting

Kubernetes CronJob-based healing controller

Predictive anomaly detection

Advanced AI-based failure classification

Key Learnings



**This project provided hands-on experience with:**



Kubernetes operations

GitOps workflows

Cloud-native observability

Auto-scaling behavior

Fault recovery automation

AI-driven remediation design

