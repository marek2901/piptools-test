dev-deps:
	@$(MAKE) deps-compile
	@$(MAKE) dev-deps-sync
deps:
	@$(MAKE) deps-compile
	@$(MAKE) deps-sync

deps-compile: ensure-pip-tools
	@pip-compile --output-file requirements.txt requirements.in
	@pip-compile --output-file dev-requirements.txt dev-requirements.in

deps-sync:
	pip-sync requirements.txt
dev-deps-sync:
	pip-sync dev-requirements.txt

ensure-pip-tools:
	@pip-compile --version > /dev/null 2>&1 || pip install pip-tools

test:
	python manage.py test
run:
	python manage.py runserver
fmt:
	autopep8 --in-place --recursive --max-line-length=100 --exclude="*/migrations/*" .
