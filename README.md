# Python-Prefab
A premade python project with front end, back end, testing and CI pipelines.

All of the documentation is generated via Sphinx and exposed via Github Pages.

[Python-Prefab Documentation](https://philliams.github.io/Python-Prefab/)

## Prerequisites
The main prerequisites for this project are:

1. Docker
2. Make


## Instructions

To build the docker images for this project, execute `make build`. Alternatively, there are commands for building individual images.

There are several run instruction that can be invoked:
1. `make run_jupyter` : run the jupyter notebook, it can be accessed as `localhost:8888`
2. `make run_backend` : run the backend FastAPI server, it can be accessed as `localhost:8000`
3. `make run_frontend` : run the streamlit frontend server, it can be accessed as `localhost:8501`
4. `make run_all` : run all of the servers using docker compose

To clean up all the docker containers, execute `make clean`.