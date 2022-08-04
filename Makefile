SRC_DIR = src
PY_DIR = $(SRC_DIR)/py
PY_ENV = $(PY_DIR)/venv

all: py_test

$(PY_ENV):
	@ python -m venv $@
	@ chmod +x $@/bin/activate
	@ ./$@/bin/activate

	@ $@/bin/pip3 install -r $(PY_DIR)/requirements.txt


py_test: $(PY_ENV)
	@ $(PY_ENV)/bin/pytest $(PY_DIR)/katas/*/*.py --cov=$(PY_DIR)
	@ $(PY_ENV)/bin/python -m coverage xml -o $(PY_DIR)/coverage.xml

clean:
	@ rm -rf coverage.xml
	@ rm -rf .coverage
	@ rm -rf $(PY_DIR)/katas/*/.pytest_cache
	@ rm -rf .pytest_cache

fclean: clean
	@ rm -rf $(PY_ENV)

.PHONY: py_test clean fclean