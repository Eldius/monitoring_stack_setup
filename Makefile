
install-mimir:
	ansible-playbook -i ./env/local/ playbooks/install-mimir.yml

uninstall-mimir:
	ansible-playbook -i ./env/local/ playbooks/uninstall-mimir.yml

install-loki:
	ansible-playbook -i ./env/local/ playbooks/install-loki.yml

uninstall-loki:
	ansible-playbook -i ./env/local/ playbooks/uninstall-loki.yml

install-tempo:
	ansible-playbook -i ./env/local/ playbooks/install-tempo.yml

uninstall-tempo:
	ansible-playbook -i ./env/local/ playbooks/uninstall-tempo.yml

install-grafana:
	ansible-playbook -i ./env/local/ playbooks/install-grafana.yml

uninstall-grafana:
	ansible-playbook -i ./env/local/ playbooks/uninstall-grafana.yml

install-all:
	ansible-playbook -i ./env/local/ playbooks/install-all.yml

uninstall-all:
	ansible-playbook -i ./env/local/ playbooks/uninstall-all.yml
