# buddy-ci-demo

API

[![Build Status](https://travis-ci.org/john555/bucketlist-api.svg?branch=master)](https://travis-ci.org/john555/bucketlist-api)
[![Coverage Status](https://coveralls.io/repos/github/john555/bucketlist-api/badge.svg?branch=challenge3)](https://coveralls.io/github/john555/bucketlist-api?branch=challenge3)
# Bucketlist API (Challenge 3)

This project is an API for a bucketlist app, that enables you to keep track of your goals or dreams.

## How to run the app

To run this project, you will need Python 3 installed on your computer.

- Install `virtualenv` and `virtualenvwrapper`.
- Clone the repository using `git clone https://github.com/john555/bucketlist-api.git`.
- Cd into the root the project root folder using `cd <folder_name>`.
- Create a virtual environment using `mkvirtual <virtual_environment_name>`.
- Activate the virtual environment using `workon <virtual_environment_name>` if it isn't activated.
- Install required packages using `pip install -r requirements.txt`.
- Create a database using postgresql and set `DATABASE_URL` as an environment variable. This is the database connection string.
- Set `APP_SECRET` as environment variable. This should be a long secret key.
- Set `REQUESTS_ORIGIN` as an environment variable. This is the domain from which the API will be consumed.
- Run the app using the `python run.py` command.

## How to run migration script
- Run `python dbmigration.py db <command>`

For more info on what commands are available, run `python dbmigration.py db --help`

### How to run tests

The tests are written using the unittest module. To execute tests,

- Run `nosetests --with-coverage --cover-package=bucketlist` from the root folder of the project.
- Alternatively you can run `python -m unittest`. 

__Note__:
Make sure to install all required dependencies and configure the app environment.

## Documentation
Documentation can be found at `/apidocs` when the app is running.



FRONTEND

[![Build Status](https://travis-ci.org/john555/bucketlist-react.svg?branch=develop)](https://travis-ci.org/john555/bucketlist-react)
[![Coverage Status](https://coveralls.io/repos/github/john555/bucketlist-react/badge.svg?branch=ch-fix-tests)](https://coveralls.io/github/john555/bucketlist-react?branch=ch-fix-tests)

# Bucketlist app (With ReactJS)
This app enables you to keep track of your goals. A bucketlist is a list of goals you wish to persue in the future, or just next week. Features include:

- Creating, editing and deleting bucketlists.
- Adding goals to bucketlists.
- Editing and deleting goals.
- Creating a user account, login and logout.

## Installation
1. Install gulp-cli

        npm install -g gulp-cli

2. Clone the app

        git clone https://github.com/john555/bucketlist-react.git

3. Change the directory to the project folder

        cd bucketlist-react

4. Install dependencies

        npm install

5. Compile Sass

        gulp sass

6. Run app

        npm start

7. To build the app

        npm run build

**Checkout the live app on heroku**

https://bucketlist-john555.herokuapp.com

**API**

https://bucketlistapp-api.herokuapp.com/

The API is written in python using the flask framework.
