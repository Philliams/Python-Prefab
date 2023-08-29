Getting Started
========================================

This tutorial will describe how to get ``Python-Prefab`` up and running from a blank machine. 
This will include installing project dependencies, building docker images, deploying containers and finally accessing the application.

Prerequisites
------------------------

The main prerequisite for this project is the package manager of your choice for your given platform:

1. OSX : Install `Homebrew <https://brew.sh/>`_
2. Windows : Install `Chocolatey <https://chocolatey.org/install>`_
3. Linux : Make sure that ``apt-get``, ``yum`` or your pacakge manager of choice is working

Installing Project Dependencies
----------------------------------

Once your package manager is installed and configured, install `Make <https://www.gnu.org/software/make/>`_ and `Docker <https://docs.docker.com/engine/install/>`_.

OSX
~~~~~~~~~~~~~~~
1. ``brew install make``
2. ``brew install docker``


Windows
~~~~~~~~~~~~~~~
1. ``choco install make``
2. ``choco install docker``

Running Application
------------------------

The application is containerized and is run using ``Docker``. Multiple commands are available in the Makefile, but the main ones are:

1. ``make build_all`` : Build docker images for the front-end, back-end, jupyter server and test environment
2. ``make run_all`` : Run the front-end, back-end and jupyter server using ``docker compose``
3. ``make test`` : Run unit tests using ``Pytest``
4. ``make build_docs`` : Build documentation using ``Sphinx``

Accessing Application
------------------------

Once the application is running using ``make run_all``, the servers can be accessed on various ports:

1. ``localhost:8000`` : access the back-end server
2. ``localhost:8501`` : access the front-end server
3. ``localhost:8888`` : access the jupyter server (note: an access token is needed to login, and can be found in the terminal output for the jupyter docker container)