# Makefile for start_project

.PHONY: help clean install develop redevelop di dclean dinstall doc check #test

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  clean		clean all files builded"
	@echo "  install	install start_project"
	@echo "  develop	install start_project in develop mode"
	@echo "  redevelop	fully install start_project in develop mode (can resolve problems)"
	@echo "  doc		install the documentation"
	@echo "  dclean		clean all documentation file builded"
	@echo "  dinstall	complete rebuild code then documentation"
	@echo "  test		start test exemples"
	@echo "  build_test	start test exemples"
	@echo "  check  	start test exemples"

clean:
	rm -rf build/
	rm -rf .eggs/
	rm -rf src/start_project.egg-info
	rm -rf src/start_project/__pycache__/
	find src/start_project/ -name '*.pyc' -delete
	find src/start_project/ -name '*.so' -delete
	find src/start_project/ -name '*.c' -delete

install:
	pip install .

develop:
	pip install -e .

redevelop:
	$(PYTHONSETUP) -q install --record _redevelop.txt
	xargs rm -rf < _redevelop.txt
	$(PYTHONSETUP) -q develop
	rm -f _redevelop.txt

doc:
	sphinx-build -M html doc/source doc/build

dclean:
	rm -rf doc/build
	rm -rf doc/source/_autosummary
	rm -rf doc/source/gallery

	find doc/ -name '*.pyc' -delete

test:
	pytest

check:
	isort .
	black src tests
	flake8
	pre-commit run --all-files
