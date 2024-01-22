# Containerize and deploy Flask app
This repository contains files that define a Flask app (`app.py`, `requirements.txt`, and the `templates` folder) and a containerfile (`containerfile`) that specifies the build steps to build a container image for the Flask app.

The following sections contain descriptions of the steps to build and deploy the containerized Flask app on AdaLab.

## Build the container image
First, open a terminal and make sure that the directory you are in, is the folder that the repository was cloned into. Then, from the terminal, build the container image with the below command:

```docker build -t to-dos-list-app:1.0 -f containerfile .```

The argument `-t to-dos-list-app:1.0` specifies the name and tag to use for the built container image, and you can specify it as you wish. The only requirement is that a container image with this name does not already exist on your local computer, as this will cause an error, and that the name follows the [Open Container Initiative (OCI) naming convention](https://github.com/containers/image/blob/main/docker/reference/regexp.go). 

The argument `-f containerfile` specifies the name of the containerfile if the containerfile is not named "Dockerfile", which is the default that the `docker build` command expects if the `-f` argument is not given.


The build process will look as shown below if you have built this image before. Otherwise, there will be some more steps in which the various components need to be downloaded to the local compute resource.


<video src="media/build_todos_flask_app_container_image.webm"></video>

[build_todos_flask_app_container_image.webm](https://github.com/adamatics/containerize-flask-app/assets/149479200/be7792dc-16ca-491f-8afe-9a496534f8c9)


## Add metadata



## Deploy



# References
The app.py file and templates folder were copied from https://github.com/LetsStartLooping/learning-flask/tree/main/05-user-input and the file requirements.txt was copied from https://github.com/LetsStartLooping/learning-flask/tree/main. Some small modifications were made in this repository after copying.
