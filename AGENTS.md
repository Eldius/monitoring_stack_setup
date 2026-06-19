# Repository Guidelines

## Project Structure & Module Organization

```
├── roles/            # Ansible roles for each monitoring component
│   ├── base/         # Shared infrastructure (directories, groups)
│   ├── alloy/        # Grafana Alloy collector
│   ├── grafana/      # Grafana visualization
│   ├── health/       # Reusable health-check role
│   ├── loki/         # Log aggregation
│   ├── mimir/        # Long-term metrics storage
│   ├── otel_collector/  # OpenTelemetry Collector (built from source)
│   ├── prometheus/   # Metrics collection
│   └── tempo/        # Distributed tracing
├── playbooks/        # Install, uninstall, healthcheck, and validate playbooks
├── env/local/        # Inventory files for local/targeted deployments
├── scripts/          # Utility scripts (e.g., hosts_fetch.py)
├── meta/             # Ansible collection metadata
├── Makefile          # Task runner (wraps uv run ansible-*)
├── pyproject.toml    # Python project config (uv-based)
└── galaxy.yml        # Ansible Galaxy collection manifest
```

Each role follows a consistent lifecycle: prerequisites → user/group setup → directories → binary mgmt → Jinja2 config → systemd unit.

## Build, Test, and Development Commands

Commands wrap `uv run ansible-*` via `make`:

| Command | Description |
| :--- | :--- |
| `make init` | Install the collection locally via `ansible-galaxy` |
| `make install-<service>` | Deploy a single service (e.g., `install-grafana`, `install-otelcoll`) |
| `make uninstall-<service>` | Remove a single service |
| `make healthcheck-<service>` | Run health check for a single service |
| `make install-all` | Deploy the full monitoring stack |
| `make uninstall-all` | Remove all components |
| `make healthcheck-all` | Health-check all deployed services |
| `make hosts` | Discover and update inventory via `scripts/hosts_fetch.py` |

To run a playbook directly: `uv run ansible-playbook -i ./env/local/ playbooks/<playbook>.yml`

## Coding Style & Naming Conventions

- **YAML/Ansible**: 2-space indentation. Use fully qualified collection names (FQCNs) for modules and roles (e.g., `eldius.monitoring_stack_setup.health`).
- **Python scripts**: Follow PEP 8. Managed via `uv`.
- **Jinja2 templates**: Use `.j2` extension. Template variables use `snake_case`.
- **Playbooks**: Lowercase with hyphen-separated words (e.g., `install-otelcoll.yml`).

## Testing Guidelines

- **Health checks**: Use `playbooks/healthcheck-<service>.yml` to verify each deployment via HTTP endpoints (e.g., `localhost:3000/api/health` for Grafana).
- **Validation**: Run `playbooks/validate-all.yml` to validate all services across groups.
- **Role tests**: Located under `roles/<service>/tests/test.yml`. Use `ansible-test` for role-level validation.

## Commit & Pull Request Guidelines

- **Commit messages**: Descriptive, present-tense summaries. No strict convention; focus on clarity.
- **Pull requests**: Describe changes, reference related issues, and ensure `make install-all` and `make healthcheck-all` pass on the target inventory.
