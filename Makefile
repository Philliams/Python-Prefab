project_name ?= python-prefab

jupyter_name = ${project_name}-jupyter
test_name = ${project_name}-test
dev_name = ${project_name}-dev

jupyter_port ?= 8888
backend_port ?= 8000



build_jupyter:
	docker build -t ${jupyter_name} -f ./docker/dockerfile_jupyter .

build_test:
	docker build -t ${test_name} -f ./docker/dockerfile_test .

build_dev:
	docker build -t ${dev_name} -f ./docker/dockerfile_dev .

run_jupyter:
	docker rm --force ${jupyter_name}
	docker run --name ${jupyter_name} \
	--mount type=bind,source=./src,target=/src \
	-it -p ${jupyter_port}:${jupyter_port} ${jupyter_name}

run_dev:
	docker rm --force ${dev_name}
	docker run --name ${dev_name} \
	-it -p ${backend_port}:${backend_port} ${dev_name}

test:
	docker rm --force ${test_name}
	docker run --name ${test_name} -it ${test_name}

ssh:
	docker attach ${project_name}

clean:
	docker rm --force ${dev_name}
	docker rm --force ${test_name}
	docker rm --force ${jupyter_name}
