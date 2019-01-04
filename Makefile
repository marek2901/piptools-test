deps-compile:
	pip-compile --output-file requirements.txt requirements.in
dev-deps-compile:
	pip-compile --output-file dev-requirements.txt dev-requirements.in
deps-sync:
	pip-sync requirements.txt
dev-deps-sync:
	pip-sync dev-requirements.txt
deps: deps-compile deps-sync
dev-deps: dev-deps-compile dev-deps-sync

test:
	python manage.py test
run:
	python manage.py runserver
fmt:
	autopep8 --in-place --recursive --max-line-length=100 --exclude="*/migrations/*" .
