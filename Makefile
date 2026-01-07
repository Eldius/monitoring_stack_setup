
install-mimir:
	ansible-playbook -i ./env/local/ install-mimir.yml

uninstall-mimir:
	ansible-playbook -i ./env/local/ uninstall-mimir.yml

install-loki:
	ansible-playbook -i ./env/local/ install-loki.yml

uninstall-loki:
	ansible-playbook -i ./env/local/ uninstall-loki.yml

install-tempo:
	ansible-playbook -i ./env/local/ install-tempo.yml

uninstall-tempo:
	ansible-playbook -i ./env/local/ uninstall-tempo.yml

install-grafana:
	ansible-playbook -i ./env/local/ install-grafana.yml

uninstall-grafana:
	ansible-playbook -i ./env/local/ uninstall-grafana.yml

install-all:
	ansible-playbook -i ./env/local/ install-all.yml

uninstall-all:
	ansible-playbook -i ./env/local/ uninstall-all.yml
