# This is a django_rest configuration project

Just to learn how to setup pip-tools correctly.

## Requirements

* pyenv or python with virtualenv

## Setup
> [WARNING] Instructions provided here are osx/linux only

* Install python 3.7 using pyenv or whatever tool you want (homebrew, apt, yum)
    * pyenv: `pyenv install 3.7.1`
    * homebrew: `brew install python3`
* create a virtual env
    * pyenv:
        * install `pyenv virtualenv 3.7.1 piptools_test`
        * activate `pyenv shell piptools_test`
    * no pyenv:
        * install `python3 -m venv .env`
        * activate `. ./.env/bin/activate` (make sure you are in project dir)
* Install project dependencies
```bash
make dev-deps-sync
```
* run tests or start app
```bash
# run tests
make test

# start app server
make run
```

## Makefile description

* dev-sync
    > synchronise both production and develop, can also be invoke with just a `make` command
* sync
    > synchronise only production deps
* deps-compile
    > compile both in files
* deps-upgrade
    > automatically updates all packages to newest versions (run with caution)
* dep-upgrade
    > upgrade single dependency, you can also specify a versions to upgrade `make dep-upgrade P=Django==2.1.4`
* dev-dep-upgrade
    > similiar as `dev-upgrade` but just for dev dependencies
* ensure-pip-tools
    > installs pip-tools if they are missing
* test
    > run tests
* run
    > run app server
* fmt
    > format codebase with autopep8
