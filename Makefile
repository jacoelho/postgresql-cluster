.PHONY: destroy up provision

all: provision

destroy:
	vagrant destroy -f

up:
	vagrant up

provision:
	ansible-playbook -i inventory playbook.yml --check
	ansible-playbook -i inventory playbook.yml -vvvv

postgresql:
	ansible-playbook -i inventory playbook.yml -vvvv --limit postgresql
