# Containerize and deploy Flask app
This repository contains files that define a Flask app (`app.py`, `requirements.txt`, and the `templates` folder) and a containerfile (`containerfile`) that specifies the build steps to build a container image for the Flask app.

The following sections contain descriptions of the steps to build and deploy the containerized Flask app on AdaLab.

To view the videos from within the README, open it on GitHub at this URL: [https://github.com/adamatics/containerize-flask-app/blob/main/README.md](https://github.com/adamatics/containerize-flask-app/blob/main/README.md).

## Build the container image
First, open a terminal and make sure that the directory you are in, is the folder that the repository was cloned into. Then, from the terminal, build the container image with the below command:

```docker build -t to-dos-list-app:1.0 -f containerfile .```

The argument `-t to-dos-list-app:1.0` specifies the name and tag to use for the built container image, and you can specify it as you wish. The only requirement is that a container image with this name does not already exist on your local computer, as this will cause an error, and that the name follows the [Open Container Initiative (OCI) naming convention](https://github.com/containers/image/blob/main/docker/reference/regexp.go). 

The argument `-f containerfile` specifies the name of the containerfile if the containerfile is not named "Dockerfile", which is the default that the `docker build` command expects if the `-f` argument is not given.


The build process will look as shown below:

[build_todos_flask_app-2024-01-22_15.45.16.webm](https://github.com/adamatics/containerize-flask-app/assets/149479200/7143daa2-c613-4d2f-be96-444c082886a4)


## Add metadata

[metadata_todos_flask_app-2024-01-22_15.46.41.webm](https://github.com/adamatics/containerize-flask-app/assets/149479200/0ce4b230-b6fd-4895-8e6d-75a5be248af7)


## Deploy

[deploy_todos_flask_app-2024-01-22_15.50.45.webm](https://github.com/adamatics/containerize-flask-app/assets/149479200/b28a37ac-89b6-41e9-a751-cb7750589b35)


[check_todos_flask_app-2024-01-22_15.52.06.webm](https://github.com/adamatics/containerize-flask-app/assets/149479200/59f9218c-a477-4c86-9665-25a44c505c44)

# References
The app.py file and templates folder were copied from https://github.com/LetsStartLooping/learning-flask/tree/main/05-user-input and the file requirements.txt was copied from https://github.com/LetsStartLooping/learning-flask/tree/main. Some small modifications were made in this repository after copying.
