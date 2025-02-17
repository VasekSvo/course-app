.PHONY: run install clean check runner
.DEFAULT_GOAL:=runner

run: install
	cd module1/src; poetry run python3 runner.py 

install: pyproject.toml
	poetry install

clean:
	rm -rf `find . -type d -name __pycache__`

check:
	poetry run flake8 module1/src/

runner: check run clean 