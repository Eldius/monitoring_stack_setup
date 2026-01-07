
install-mimir:
	ansible-playbook -i ./env/local/ install-mimir.yml

uninstall-mimir:
	ansible-playbook -i ./env/local/ uninstall-mimir.yml

install-loki:
	ansible-playbook -i ./env/local/ install-loki.yml

uninstall-loki:
	ansible-playbook -i ./env/local/ uninstall-loki.yml