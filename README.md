Locust test app
===========

***

![Django](https://lh5.googleusercontent.com/-BjCviey1170/AAAAAAAAAAI/AAAAAAAAABQ/A9zxQUjc3C4/photo.jpg?sz=64)
![Python](http://blog.magiksys.net/sites/default/files/pictures/python-logo-64.png)


Overview
========

***

Platform
--------

* OS: Ubuntu 14.04 LTS
* Language: Python 2.7
* Framework: Django 1.8 / Django Rest Framework 3.3.1
* Database: Postgres


Using the app
=============

This app uses a `.env` file to handle all sensitive data. This file should be located inside the app directory (beside the `manage.py` file), and populated with the fields below, Note any lists in the `.env` file, should be represented by a comma seperated string.

    ENV="LOCAL"

    ALLOWED_HOSTS="127.0.0.1,localhost"
    SECRET_KEY=random_string
    DATABASE_URL="postgres://locust:locust@db/locust"


Running the app
===============

The easiest way to run this app is with [Docker][docker] and the makefiles.
Ensure docker is installed on your system ([Installation instructions][docker_compose_install]), and in your terminal run:

    $ make run

This will boot up a docker container exposing ports `8000` (app) and `5432` (db). Then visit the running application [http://127.0.0.1:8000](http://127.0.0.1:8000)


*Note if you are running this with boot2docker, ensure you have mapped your vm's ports are mapped correctly with:

    VBoxManage controlvm boot2docker-vm natpf1 "django,tcp,127.0.0.1,8000,,8000"


Check out the `Makefile` in the repository root for all available commands.


API
-------------

This apps primary functionality is to load test against api endpoints, so there is no frontend build. The app is built with django rest framework which provides a nice interface for navigating through the api, but we also provide more detailed documentation of all the apis with the Swagger UI.

To view the api docuemtation navigate to:

    127.0.0.1:8000/docs/


Admin account
-------------

An admin account is added by default, to allow access to the admin sections.

    Username: locust
    Password: locust


Stopping the app
===============

To stop the app, simply press `Ctrl+C` in the running terminal.

[docker]: https://docker.io  "Docker"
[docker_compose_install]: https://docs.docker.com/compose/install/  "Docker & Compose Installation"
