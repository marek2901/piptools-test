dev-sync: ensure-pip-tools
	@pip-sync dev-requirements.txt
sync: ensure-pip-tools
	@pip-sync requirements.txt

deps-compile:
	@pip-compile --output-file requirements.txt requirements.in
	@pip-compile --output-file dev-requirements.txt dev-requirements.in
deps-upgrade:
ifdef P
	@pip-compile -P $(P) --output-file requirements.txt requirements.in
	@$(MAKE) deps-compile
else
	@echo "specify which deps to upgrade for ex: make deps-upgrade P=Django"
endif
dev-deps-upgrade:
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
