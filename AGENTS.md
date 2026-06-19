# Project Overview: Monitoring Stack Setup

This project is an Ansible collection designed to automate the installation, configuration, and management of a comprehensive monitoring stack. It supports several components from the Grafana ecosystem, Prometheus, and OpenTelemetry.

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
  - **OpenTelemetry Collector**: Vendor-agnostic proxy to receive, process, and export telemetry data.

## Architecture and Structure
The project follows a standard Ansible collection structure:
- **`roles/`**: Contains the logic for each service.
  - `base`: Sets up shared directories (`/usr/local/monitoring` for binaries, `/var/lib/monitoring` for data), creates common groups, and ensures prerequisites.
  - `alloy`, `grafana`, `loki`, `mimir`, `prometheus`, `tempo`, `otel_collector`: Specific roles for each tool.
- **`playbooks/`**: Entry point for various operations (install, uninstall, healthcheck).
- **`env/local/hosts.yml`**: Default inventory for local/targeted deployments.
- **`scripts/`**: Utility scripts, such as `hosts_fetch.py` for dynamic host discovery.
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
| `make install-<service>` | Deploys a specific service (e.g., `make install-grafana`, `make install-otelcoll`). |
| `make uninstall-all` | Removes all components from the target hosts. |
| `make healthcheck-all` | Runs health checks for all components. |
| `make hosts` | Fetches/updates host information using `scripts/hosts_fetch.py`. |

## Development Conventions

### Role Pattern
Each role follows a consistent pattern to ensure maintainability:
1. **Prerequisites**: Check for necessary system tools or dependencies.
2. **User/Group**: Create dedicated system users/groups for the service (e.g., `grafana` user).
3. **Directories**: Create necessary folders for binaries, configuration, and data.
4. **Binary Management**: Download or build (e.g., `otel_collector`) binaries and place them in the installation folder.
5. **Configuration**: Use Jinja2 templates (`templates/`) to generate configuration files.
6. **Systemd**: Deploy and enable a systemd unit file (`templates/*.service.j2`).

### Shared Infrastructure (`base` role)
The `base` role provides a foundation for other roles. It defines:
- `base_install_folder`: `/usr/local/monitoring`
- `base_data_folder`: `/var/lib/monitoring`
- Common system groups and basic packages.

### Adding a New Service
1. Create a new role in `roles/` following the existing pattern.
2. Consider adding `base` as a dependency if it shares the common infrastructure.
3. Create install, uninstall, and healthcheck playbooks in `playbooks/`.
4. Update the `Makefile` with corresponding targets.
5. Update `playbooks/install-all.yml` and `playbooks/uninstall-all.yml` to include the new service.

### Testing
- Use `playbooks/healthcheck-<service>.yml` to verify the deployment.
- Role-specific tests are located in `roles/<service>/tests/`.
