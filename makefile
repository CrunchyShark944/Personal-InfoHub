LINTER = flake8
SRC_DIR = app
REQ_DIR = requirements

FORCE:

prod: tests github

github: FORCE
	- git commit -a
	git push origin master

tests: lint unit

unit: FORCE
	echo "We have to write some tests!"

lint: FORCE
	$(LINTER) $(SRC_DIR)/*.py

dev_env: FORCE
	pip3 install -r $(REQ_DIR)/requirements-dev.txt