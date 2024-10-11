test:
	rm -Rf ~/.ansible/roles/casino.ggndemobackoffice
	PY_COLORS=1 ANSIBLE_FORCE_COLOR=1 molecule test
deps:
	pip3 install ansible molecule molecule-plugins[docker] docker
