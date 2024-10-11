test:
	rm -Rf ~/.ansible/roles/casino.entropy
	PY_COLORS=1 ANSIBLE_FORCE_COLOR=1 molecule test
converge:
	rm -Rf ~/.ansible/roles/casino.entropy
	PY_COLORS=1 ANSIBLE_FORCE_COLOR=1 molecule converge
deps:
	pip3 install ansible molecule molecule-plugins[docker] docker
