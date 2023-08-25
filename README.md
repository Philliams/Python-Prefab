# Python-Prefab
A premade python project with front end, back end, testing and CI pipelines.

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

To clean up all the docker containers, execute `make clean`.