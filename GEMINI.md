# Project Overview: Monitoring Stack Setup

This project is an Ansible collection designed to automate the installation, configuration, and management of a comprehensive monitoring stack. It supports several components from the Grafana ecosystem and Prometheus.

## Main Technologies
- **Ansible**: Core automation tool for deployment and configuration.
- **Python (uv)**: Used for managing dependencies and running Ansible.
- **Monitoring Components**:
  - **Grafana**: For visualization and dashboards.
  - **Prometheus**: For metrics collection.
  - **Loki**: For log aggregation.
  - **Tempo**: For distributed tracing.
  - **Mimir**: For long-term metrics storage.
  - **Alloy**: Grafana's OpenTelemetry-compatible collector.

## Architecture and Structure
The project follows a standard Ansible collection structure:
- **`roles/`**: Contains the logic for each service.
  - `base`: Sets up shared directories (`/usr/local/monitoring` for binaries, `/var/lib/monitoring` for data).
  - `alloy`, `grafana`, `loki`, `mimir`, `prometheus`, `tempo`: Specific roles for each tool.
- **`playbooks/`**: Entry point for various operations (install, uninstall, healthcheck).
- **`env/local/hosts.yml`**: Default inventory for local/targeted deployments.
- **`Makefile`**: Provides a convenient interface for common tasks.

## Building and Running

### Prerequisites
- Python 3.12+
- `uv` (Fast Python package installer and resolver)
- `make`

### Common Commands
All commands are prefixed with `uv run` via the `Makefile`.

| Command | Description |
| :--- | :--- |
| `make init` | Installs the collection locally and prepares the environment. |
| `make install-all` | Deploys the entire monitoring stack. |
| `make install-<service>` | Deploys a specific service (e.g., `make install-grafana`). |
| `make uninstall-all` | Removes all components from the target hosts. |
| `make healthcheck-all` | Runs health checks for all components. |
| `make hosts` | Fetches/updates host information using `scripts/hosts_fetch.py`. |

## Development Conventions
- **Role Pattern**: Each role typically includes tasks for creating users/groups, preparing folders, downloading/extracting binaries, templating configuration, and setting up systemd services.
- **Paths**: Defaults are defined in the `base` role. Installation folder is typically `/usr/local/monitoring/<service>` and data folder is `/var/lib/monitoring/<service>`.
- **Systemd**: All services are managed via systemd for lifecycle control (start, stop, enable).
- **Templates**: Configuration files are managed using Jinja2 templates found in `roles/<service>/templates/`.
- **Environment Management**: Use `uv` for all interactions to ensure consistent versions of Ansible and its dependencies.
