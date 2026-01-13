
init:
	ansible-galaxy collection install --force .

install-mimir:
	ansible-playbook -i ./env/local/ playbooks/install-mimir.yml

uninstall-mimir:
	ansible-playbook -i ./env/local/ playbooks/uninstall-mimir.yml

install-loki:
	ansible-playbook -i ./env/local/ playbooks/install-loki.yml

uninstall-loki:
	ansible-playbook -i ./env/local/ playbooks/uninstall-loki.yml

healthcheck-loki:
	ANSIBLE_NOCOWS=1 ansible-playbook -i ./env/local/ playbooks/healthcheck-loki.yml

install-tempo:
	ansible-playbook -i ./env/local/ playbooks/install-tempo.yml

uninstall-tempo:
	ansible-playbook -i ./env/local/ playbooks/uninstall-tempo.yml

install-grafana:
	ansible-playbook -i ./env/local/ playbooks/install-grafana.yml

uninstall-grafana:
	ansible-playbook -i ./env/local/ playbooks/uninstall-grafana.yml

healthcheck-grafana:
	ansible-playbook -i ./env/local/ playbooks/healthcheck-grafana.yml

install-prometheus:
	ansible-playbook -i ./env/local/ playbooks/install-prometheus.yml

uninstall-prometheus:
	ansible-playbook -i ./env/local/ playbooks/uninstall-prometheus.yml

install-alloy:
	ansible-playbook -i ./env/local/ playbooks/install-alloy.yml

uninstall-alloy:
	ansible-playbook -i ./env/local/ playbooks/uninstall-alloy.yml

healthcheck-alloy:
	ansible-playbook -i ./env/local/ playbooks/healthcheck-alloy.yml

install-all:
	ansible-playbook -i ./env/local/ playbooks/install-all.yml

uninstall-all:
	ansible-playbook -i ./env/local/ playbooks/uninstall-all.yml
