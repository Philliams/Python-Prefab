project_name ?= python-prefab

jupyter_name = ${project_name}-jupyter
test_name = ${project_name}-test
dev_name = ${project_name}-dev

frontend_name = ${project_name}-frontend
backend_name = ${project_name}-backend

jupyter_port ?= 8888
backend_port ?= 8000
frontend_port ?= 8501

# BUILD COMMANDS
build_dev:
	docker build -t ${dev_name} -f ./docker/dockerfile_dev .

build_test: build_dev
	docker build -t ${test_name} -f ./docker/dockerfile_test .

build_jupyter: build_dev
	docker build -t ${jupyter_name} -f ./docker/dockerfile_jupyter .

build_all: build_dev build_test build_jupyter

# RUN COMMANDS
run_jupyter: build_jupyter
	docker rm --force ${jupyter_name}
	docker run --name ${jupyter_name} \
	--mount type=bind,source=./src,target=/src \
	-it -p ${jupyter_port}:${jupyter_port} ${jupyter_name}

run_backend: build_dev
	docker rm --force ${backend_name}
	docker run --name ${backend_name} \
	-it -p ${backend_port}:${backend_port} ${dev_name} \
	python /src/backend/main_backend.py

run_frontend: build_dev
	docker rm --force ${frontend_name}
	docker run --name ${frontend_name} \
	-it -p ${frontend_port}:${frontend_port} ${dev_name} \
	streamlit run /src/frontend/main_frontend.py --server.port=${frontend_port} --server.address=0.0.0.0

run_all: build
	docker compose -f ./docker/compose.yaml up

# TEST COMMANDS
test: build_test
	docker rm --force ${test_name}
	docker run --name ${test_name} ${test_name} \
	python -m pytest --cov=src unittests/

# MISC. COMMANDS
clean:
	docker rm --force ${dev_name}
	docker rm --force ${test_name}
	docker rm --force ${jupyter_name}
	docker rm --force ${frontend_name}
	docker rm --force ${backend_name}
	docker compose -f ./docker/compose.yaml down
	mv ./docs/build/.gitignore ./docs/.gitignore
	rm -rf ./docs/build/
	mkdir ./docs/build/
	mv ./docs/.gitignore ./docs/build/.gitignore

build_docs: build_test
	mv ./docs/build/.gitignore ./docs/.gitignore
	rm -rf ./docs/build/
	mkdir ./docs/build/
	mv ./docs/.gitignore ./docs/build/.gitignore
	docker rm --force ${test_name}
	docker run --name ${test_name} \
	--mount type=bind,source=./docs/build,target=/docs/build ${test_name} \
	/bin/bash -c "python -m pytest --cov=src unittests/ --cov-report html:./docs/source/_static/code_cov/; \
	sphinx-build -b html ./docs/source ./docs/build"
	
lint: build_test
	docker rm --force ${test_name}
	docker run --name ${test_name} \
	--mount type=bind,source=./src/,target=/src/ ${test_name} \
	/bin/bash -c "isort ./src/ -v; ruff check ./src -v; mypy ./src/"