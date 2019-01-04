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

* deps-compile
    > compile only production dependencies
* dev-deps-compile
    > compile prod deps and debug/develop
* deps-sync
    > synchronise only production deps
* dev-deps-sync
    > synchronise both production and develop
* deps
    > run prod deps compile and sync
* dev-deps
    > run prod and develop/debug deps compile and sync
* test
    > run tests
* run
    > run app server
* fmt
    > format codebase with autopep8
