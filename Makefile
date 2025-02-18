.PHONY: run install clean check runner
.DEFAULT_GOAL:=runner

run: install
	cd inference_service/app; poetry run python3 run.py 

install: pyproject.toml
	poetry install

clean:
	rm -rf `find . -type d -name __pycache__`

check:
	poetry run flake8 inference_service/app/

runner: check run clean