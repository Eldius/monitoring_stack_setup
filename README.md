# Ansible Collection - eldius.monitoring_stack_setup

This Ansible collection automates the deployment and configuration of a complete monitoring stack using the Grafana ecosystem and Prometheus.

## Supported Components

The collection provides roles and playbooks for the following services:

- **Grafana**: Visualization and dashboards.
- **Prometheus**: Metrics collection and alerting.
- **Loki**: Log aggregation and search.
- **Tempo**: Distributed tracing.
- **Mimir**: Scalable, long-term storage for Prometheus metrics.
- **Alloy**: Grafana's OpenTelemetry-compatible collector for logs, metrics, and traces.

## Prerequisites

Before using this collection, ensure you have the following installed on your local machine:

- **Python 3.12+**
- **uv**: A fast Python package installer and resolver.
- **make**: For running commands via the Makefile.

## Quick Start

1. **Initialize the environment**:
   Installs the required Python dependencies and the Ansible collection itself.
   ```bash
   make init
   ```

2. **Deploy the full stack**:
   Runs the `install-all.yml` playbook against the default inventory.
   ```bash
   make install-all
   ```

## Usage

The project includes a `Makefile` to simplify common operations.

| Command | Description |
| :--- | :--- |
| `make init` | Prepares the environment and installs the collection. |
| `make install-all` | Deploys all monitoring components. |
| `make install-grafana` | Deploys only Grafana. |
| `make install-prometheus` | Deploys only Prometheus. |
| `make install-loki` | Deploys only Loki. |
| `make install-tempo` | Deploys only Tempo. |
| `make install-mimir` | Deploys only Mimir. |
| `make install-alloy` | Deploys only Alloy. |
| `make healthcheck-all` | Validates the status of all deployed services. |
| `make uninstall-all` | Removes the entire stack from the target hosts. |

## Project Structure

- **`roles/`**: Contains the configuration logic for each monitoring service.
- **`playbooks/`**: Entry points for installation, uninstallation, and health checks.
- **`env/local/hosts.yml`**: Default inventory file for targeting your hosts.
- **`scripts/`**: Utility scripts for environment management.

## Reference Links

- [Configure Prometheus to write to Grafana Mimir](https://grafana.com/docs/mimir/latest/get-started/#configure-prometheus-to-write-to-grafana-mimir)
- [Grafana Documentation](https://grafana.com/docs/)
- [Ansible Documentation](https://docs.ansible.com/)
