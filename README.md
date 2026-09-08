# InfraDeploy

Infrastructure-as-Code project for deploying and managing containerized applications using Docker and Terraform.

## 🚀 Overview

InfraDeploy demonstrates how Docker infrastructure can be created, configured, verified, and destroyed using Terraform instead of relying entirely on manual Docker commands.

The project uses a simple Bash application as the containerized workload and a custom Docker bridge network for container-to-container communication.

## 🛠️ Technologies

* Linux / Ubuntu
* Bash
* Git & GitHub
* Docker
* Docker Networking
* Terraform
* Terraform Docker Provider

## 📁 Project Structure

```text
InfraDeploy/
├── app/
│   ├── app.sh
│   └── Dockerfile
├── terraform/
│   ├── main.tf
│   └── .terraform.lock.hcl
├── docker/
├── ansible/
├── scripts/
├── .gitignore
└── README.md
```

## 🐳 Docker

The application is containerized using a custom Dockerfile based on Ubuntu.

The project uses a custom Docker bridge network called `infradeploy-net`. Two containers, `infradeploy-app` and `infradeploy-app-1`, are connected to this network.

Docker's internal DNS was used to verify container-to-container name resolution.

## 🏗️ Terraform

Terraform is used to manage the Docker infrastructure as code.

The Terraform configuration creates one Docker bridge network and two Docker containers, with both containers automatically attached to the network.

### Terraform Workflow

```text
terraform init
      ↓
terraform plan
      ↓
terraform apply
      ↓
Verify infrastructure
      ↓
terraform plan
      ↓
terraform destroy
```

The complete Terraform lifecycle was successfully tested. After deployment, `terraform plan` returned `No changes. Your infrastructure matches the configuration.`, confirming that the Terraform configuration matched the deployed infrastructure.

## ▶️ Usage

### Initialize Terraform

```bash
cd terraform
terraform init
```

### Preview Infrastructure

```bash
terraform plan
```

### Create Infrastructure

```bash
terraform apply
```

Confirm with `yes` when prompted.

### Verify Containers

```bash
docker ps
```

### Verify Network

```bash
docker network inspect infradeploy-net
```

### Destroy Infrastructure

```bash
terraform destroy
```

## 🔐 Git Security

Terraform state files and variable files are excluded from Git using `.gitignore`.

Ignored files include `.terraform/`, `*.tfstate`, `*.tfstate.*`, and `*.tfvars`.

Terraform state files should not normally be committed to a public repository because they may contain infrastructure details or sensitive values.

## 📚 What I Learned

* Linux command-line usage
* Bash scripting
* Git and GitHub workflow
* Docker image creation
* Docker container lifecycle
* Docker bridge networking
* Container-to-container DNS resolution
* Terraform providers and resources
* Infrastructure as Code
* Terraform state management
* Terraform initialization, planning, deployment, verification, and destruction

## 🎯 Future Improvements

* GitHub Actions CI/CD
* Automated Docker image builds
* Container image registry
* AWS infrastructure deployment
* Infrastructure monitoring
* Security scanning
* Ansible-based configuration management

## 👨‍💻 Author

**Sunil Joshi**

DevOps / Cloud Engineering Portfolio Project
