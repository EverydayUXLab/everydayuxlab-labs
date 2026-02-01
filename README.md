# EverydayUXLab – Internal Tool UX Audit Labs

This repository contains **reproducible lab environments** used by **[EverydayUXLab](https://everydayuxlab.com)** to audit the UX of internal engineering tools (CI/CD, MLOps, DevOps, and Data Platforms).

**The goal is not UI decoration.** It is operational assurance.

> We evaluate how real engineers experience tools under real constraints:
> * **Cognitive Load:** How much memory is required to complete a task?
> * **Error Recovery:** How easily can a user undo a mistake?
> * **Misconfiguration Risk:** Do defaults lead to production outages?
> * **Time-to-Diagnosis:** How fast can a root cause be identified?
> 
> 

These labs power our [YouTube Teardown Series](https://youtube.com/@everydayuxlab), technical audits, and open-source reviews.

---

## 🎯 Scope

### ✅ This repo is:

* **Reproducible:** A Vagrant-based VM aimed at creating a "clean slate" for every audit.
* **Production-Proximate:** Configurations mirror real-world engineering environments, not "Hello World" tutorials.
* **Tool-Agnostic:** Designed to spin up Jenkins, Airflow, or Kubeflow on demand.
* **Evidence-Based:** Built to generate artifacts (logs, screenshots, recordings) for analysis.

### ❌ This repo is not:

* A SaaS starter kit.
* A polished product demo.
* A UI showcase or component library.
* A tutorial for beginners.

If you are here to understand **why engineers struggle with their tools**, you are in the right place.

---

## 🧱 Architecture

The lab runs on a **Host -> Guest VM -> Container** architecture to ensure total isolation during destructive testing.

* **Vagrant:** Orchestrates the VM lifecycle.
* **VirtualBox:** Underlying hypervisor.
* **Ubuntu 22.04 LTS:** Base OS (Standard for MLOps/Data tooling).
* **Docker:** Used for application deployment within the VM.

```ascii
[ Host Machine ]
      |
      └── [ Vagrant VM (192.168.56.10) ]
              |
              ├── Docker Engine
              ├── /var/log/audit (Shared Mount)
              └── Containers (On-Demand)
                    ├── Jenkins
                    ├── Airflow
                    ├── Grafana
                    └── MLflow

```

### Repository Structure

```text
everydayuxlab-labs/
├── Vagrantfile             # VM definition
├── README.md
├── provision/
│   ├── common.sh           # Base packages (Docker, git, htop)
│   ├── ubuntu.sh           # Python/Pip env setup
│   └── tools/              # Tool-specific installation scripts
│       ├── jenkins.sh
│       ├── airflow.sh
│       ├── grafana.sh
│       └── mlflow.sh
└── audit-artifacts/        # (Ignored) Storage for screenshots/logs

```

---

## 🚀 Quick Start

### 1. Prerequisites

Ensure you have the following installed on your host machine:

* [VirtualBox](https://www.google.com/search?q=https://www.virtualbox.org/) (7.0+)
* [Vagrant](https://www.google.com/search?q=https://www.vagrantup.com/) (2.3+)
* **RAM:** 8 GB minimum recommended for MLOps tools.

```bash
vagrant --version
virtualbox --version

```

### 2. Initialize the Lab

Spin up the base environment. This creates the VM and installs Docker.

```bash
# Start the VM
vagrant up

# SSH into the isolated environment
vagrant ssh

```

*The VM is static-mapped to:* `192.168.56.10`

### 3. Provision a Tool

Once inside the VM (`vagrant ssh`), choose a tool to audit.

**Example: Installing Jenkins**

```bash
cd /vagrant
bash provision/tools/jenkins.sh

```

**Access the UI:**
Open `http://192.168.56.10:8080` in your host browser.

---

## 🧪 Supported Tools (Current Labs)

| Tool | Category | Port | Audit Focus |
| --- | --- | --- | --- |
| **Jenkins** | CI/CD | `8080` | Pipeline visualization, plugin clutter, error logs. |
| **Airflow** | Data Engineering | `8080` | DAG ergonomics, dependency visualization, backfill UX. |
| **Grafana** | Observability | `3000` | Alert comprehension, query builder friction. |
| **MLflow** | MLOps | `5000` | Experiment tracking comparison, model registry flows. |

*New tools are added strictly when they are scheduled for an audit.*

---

## 🎥 The Audit Workflow

How we produce a teardown using this repo:

1. **Clean State:** `vagrant destroy -f && vagrant up` to ensure no legacy config artifacts.
2. **Provision:** Install specific tool via script.
3. **The "First Run" Record:** Screen record the initial setup, default config experience, and "Hello World" deployment.
4. **Stress Test:** Intentionally trigger failure modes (broken builds, missing dependencies) to audit error messages.
5. **Analysis:**
* *What context is missing?*
* *Are error states irreversible?*
* *Does the UI force unsafe defaults?*


6. **Publish:** Findings released on [YouTube](https://youtube.com/@everydayuxlab).

---

## 🧠 Audit Philosophy

We optimize for **Safety** and **Speed**.

1. **Error Prevention > Visual Polish:** A button that looks good but deletes a database without confirmation is a design failure.
2. **Operational Clarity > Feature Density:** Can an on-call engineer understand the system state in 30 seconds at 2 AM?
3. **Defaults Matter:** Defaults should not betray the user.

---

## 🧩 Who This Is For

* **Platform Engineers:** To audit tools before adopting them.
* **Engineering Managers:** To understand why their team is moving slowly.
* **Open Source Maintainers:** To see how new users experience their onboarding.

---

## 📜 License & Usage

**MIT License** — Use freely, fork responsibly.

**Note to Maintainers:**
This repo is opinionated. Feedback is evidence-based. If I audit your tool, I will provide technical reasoning for every critique.

---

### About EverydayUXLab

We bridge the gap between complex backend engineering and clear user experience. We reduce operational risk and cognitive load for mission-critical systems.

* 🌐 **Website:** [everydayuxlab.com](https://everydayuxlab.com)
* 📺 **YouTube:** [@EverydayUXLab](https://youtube.com/@everydayuxlab)
* 💼 **LinkedIn:** [EverydayUXLab](https://linkedin.com/company/everydayuxlab)

> *"I fix the tools engineers use."*