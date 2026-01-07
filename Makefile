
install-mimir:
	ansible-playbook -i ./env/local/ install-mimir.yml

uninstall-mimir:
	ansible-playbook -i ./env/local/ uninstall-mimir.yml
