project_name ?= python-prefab

jupyter_port ?= 8888

build_jupyter:
	docker build -t ${project_name}-jupyter -f ./docker/dockerfile_jupyter .

build_dev:
	docker build -t ${project_name}-dev -f ./docker/dockerfile_dev .

run_jupyter:
	docker run --name ${project_name}-jupyter \
	--mount type=bind,source=./src,target=/src \
	-it -p ${jupyter_port}:${jupyter_port} ${project_name}-jupyter
	docker rm --force ${project_name}-jupyter

test:
	docker run --name ${project_name}-dev -it ${project_name}-dev
	docker rm --force ${project_name}-dev

ssh:
	docker attach ${project_name}

clean:
	docker rm --force ${project_name}-jupyter
	docker rm --force ${project_name}-dev