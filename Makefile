project_name ?= python-prefab

build:
	docker build -t ${project_name} ./docker

run:
	docker run --name ${project_name} -it ${project_name}

ssh:
	docker attach ${project_name}