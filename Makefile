
init:
	ansible-galaxy collection install --force .

install-mimir:
	uv run ansible-playbook -i ./env/local/ playbooks/install-mimir.yml

uninstall-mimir:
	uv run ansible-playbook -i ./env/local/ playbooks/uninstall-mimir.yml

install-loki:
	uv run ansible-playbook -i ./env/local/ playbooks/install-loki.yml

uninstall-loki:
	uv run ansible-playbook -i ./env/local/ playbooks/uninstall-loki.yml

healthcheck-loki:
	uv run ansible-playbook -i ./env/local/ playbooks/healthcheck-loki.yml

install-tempo:
	uv run ansible-playbook -i ./env/local/ playbooks/install-tempo.yml

uninstall-tempo:
	uv run ansible-playbook -i ./env/local/ playbooks/uninstall-tempo.yml

install-grafana:
	uv run ansible-playbook -i ./env/local/ playbooks/install-grafana.yml

uninstall-grafana:
	uv run ansible-playbook -i ./env/local/ playbooks/uninstall-grafana.yml

healthcheck-grafana:
	uv run ansible-playbook -i ./env/local/ playbooks/healthcheck-grafana.yml

install-prometheus:
	uv run ansible-playbook -i ./env/local/ playbooks/install-prometheus.yml

uninstall-prometheus:
	uv run ansible-playbook -i ./env/local/ playbooks/uninstall-prometheus.yml

install-alloy:
	uv run ansible-playbook -i ./env/local/ playbooks/install-alloy.yml

uninstall-alloy:
	uv run ansible-playbook -i ./env/local/ playbooks/uninstall-alloy.yml

healthcheck-alloy:
	uv run ansible-playbook -i ./env/local/ playbooks/healthcheck-alloy.yml

install-all:
	uv run ansible-playbook -i ./env/local/ playbooks/install-all.yml

uninstall-all:
	uv run ansible-playbook -i ./env/local/ playbooks/uninstall-all.yml

healthcheck-all:
	uv run ansible-playbook -i ./env/local/ playbooks/healthcheck-all.yml

hosts:
	uv run python scripts/hosts_fetch.py