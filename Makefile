dev-sync: ensure-pip-tools
	@pip-sync dev-requirements.txt
sync: ensure-pip-tools
	@pip-sync requirements.txt

deps-compile: ensure-pip-tools
	@pip-compile --output-file requirements.txt requirements.in
	@pip-compile --output-file dev-requirements.txt dev-requirements.in
deps-upgrade: ensure-pip-tools
	@pip-compile --upgrade --output-file requirements.txt requirements.in
	@pip-compile --upgrade --output-file dev-requirements.txt dev-requirements.in
dep-upgrade: ensure-pip-tools
ifdef P
	@pip-compile -P $(P) --output-file requirements.txt requirements.in
	@$(MAKE) deps-compile
else
	@echo "specify which deps to upgrade for ex: make deps-upgrade P=Django"
endif
dev-dep-upgrade: ensure-pip-tools
ifdef P
	@pip-compile -P $(P) --output-file dev-requirements.txt dev-requirements.in
	@$(MAKE) deps-compile
else
	@echo "specify which deps to upgrade for ex: make dev-deps-upgrade P=Django"
endif

ensure-pip-tools:
	@pip-sync --version > /dev/null 2>&1 || pip install pip-tools

test:
	python manage.py test
run:
	python manage.py runserver
fmt:
	autopep8 --in-place --recursive --max-line-length=100 --exclude="*/migrations/*" .
