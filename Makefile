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
build_jupyter:
	docker build -t ${jupyter_name} -f ./docker/dockerfile_jupyter .

build_test:
	docker build -t ${test_name} -f ./docker/dockerfile_test .

build_dev:
	docker build -t ${dev_name} -f ./docker/dockerfile_dev .

build: build_dev build_test build_jupyter

# RUN COMMANDS
run_jupyter:
	docker rm --force ${jupyter_name}
	docker run --name ${jupyter_name} \
	--mount type=bind,source=./src,target=/src \
	-it -p ${jupyter_port}:${jupyter_port} ${jupyter_name}

run_backend:
	docker rm --force ${backend_name}
	docker run --name ${backend_name} \
	-it -p ${backend_port}:${backend_port} ${dev_name} \
	python /src/backend/main_backend.py

run_frontend:
	docker rm --force ${frontend_name}
	docker run --name ${frontend_name} \
	-it -p ${frontend_port}:${frontend_port} ${dev_name} \
	streamlit run /src/frontend/main_frontend.py --server.port=${frontend_port} --server.address=0.0.0.0

run_all:
	docker compose -f ./docker/compose.yaml up

# TEST COMMANDS
test:
	docker rm --force ${test_name}
	docker run --name ${test_name} -it ${test_name} \
	python -m pytest --cov=src unittests/


# MISC. COMMANDS
clean:
	docker rm --force ${dev_name}
	docker rm --force ${test_name}
	docker rm --force ${jupyter_name}
	docker rm --force ${frontend_name}
	docker rm --force ${backend_name}
	docker compose -f ./docker/compose.yaml down

build_docs:
	docker rm --force ${test_name}
	docker run --name ${test_name} \
	--mount type=bind,source=./docs,target=/docs -it ${test_name} \
	sphinx-build -b html ./docs/source ./docs/build
