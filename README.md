# Containerize and deploy Flask app
This repository contains files that define a Flask app (`app.py`, `requirements.txt`, and the `templates` folder) and a containerfile (`containerfile`) that specifies the build steps to build a container image for the Flask app.

The app is quite simple, and does not have a database attached. It has a landing page, from which there is a link to another page in the app which allows the user to add items to a To Do list. The list is not saved between launches of the app, and items cannot be removed. You can experiment with the code in `app.py` to see if you can find a way to check or remove items from the list.

The following sections contain descriptions of the steps to build and deploy the containerized Flask app on AdaLab.

To view the videos from within the README, open it on GitHub at this URL: [https://github.com/adamatics/containerize-flask-app/blob/main/README.md](https://github.com/adamatics/containerize-flask-app/blob/main/README.md).

## Build the container image
First, open a terminal and make sure that the directory you are in, is the folder that the repository was cloned into. Then, from the terminal, build the container image with the below command:

```docker build -t to-dos-list-app:1.0 -f containerfile .```

The argument `-t to-dos-list-app:1.0` specifies the name and tag to use for the built container image, and you can specify it as you wish. The only requirement is that a container image with this name does not already exist on your local computer, as this will cause an error, and that the name follows the [Open Container Initiative (OCI) naming convention](https://github.com/containers/image/blob/main/docker/reference/regexp.go). 

The argument `-f containerfile` specifies the name of the containerfile if the containerfile is not named "Dockerfile", which is the default that the `docker build` command expects if the `-f` argument is not given.

The build process will look as shown below (if viewing this from within VSCode, you will need to download the videos in the `media/` folder and play the videos locally to watch them):

[build_todos_flask_app-2024-01-22_15.45.16.webm](https://github.com/adamatics/containerize-flask-app/assets/149479200/7143daa2-c613-4d2f-be96-444c082886a4)


## Add metadata
Once the container image building process is complete, you will have the container image available in your Lab on the AdaLab platform. One way to view the container image file is with this command in a terminal, which can be executed from any location:

```docker images```

Once the image has finished building, metadata needs to be added. This will make it easier for your colleagues to find your container image, and will also prepare the app defined by the container image to be deployed. After specifying the metadata, the publish button will push the container image, as well as the metadata, to a central storage location, making it available for deployment.

To add metadata, go to the AdaLab menu, then choose "Container Metadata", and click the "Add New" button, as shown in the video below:

[metadata_todos_flask_app-2024-01-22_15.46.41.webm](https://github.com/adamatics/containerize-flask-app/assets/149479200/0ce4b230-b6fd-4895-8e6d-75a5be248af7)

Next, you simply wait a few minutes for the publishing process to complete. Click the **Refresh** button at the top of the Container Metadata page to check whether the publishing process finished. You can also watch the logs to follow along with the build process, or view them after the publishing process finished, by clicking on the triple dot menu on the right-hand side of your container image metadata entry.

## Deploy
Once the Container Metadata publishing process finished successfully, an option to deploy the container image as an app will appear in the triple dot menu for the Container Metadata entry. Click this to open a dialog box in which you can fill in the details about the app, such as the name you want it to have, and the URL the app will be available at. You can also specify other settings such as resource usage, environment variables, and the startup command. 

To make links between pages in the app work, some care must be taken to specify matching values for the URL that the app is deployed at, and the `--env SCRIPT_NAME=` argument in the startup command for the app. Also, to make these links work, the **Strip Prefix** checkbox must be unchecked, as shown below:

[deploy_todos_flask_app-2024-01-22_15.50.45.webm](https://github.com/adamatics/containerize-flask-app/assets/149479200/b28a37ac-89b6-41e9-a751-cb7750589b35)

The startup command can either be defined in the containerfile, or it can defined or overwritten in `Advanced Settings` when the app is deployed. If defining the startup command in the `Advanced Settings` when deploying the app, it needs to be of the following format:

`gunicorn -w 2 -b 0.0.0.0:5000 --env SCRIPT_NAME=/apps/a-very-cool-app-name app:app`,

where `a-very-cool-app-name` should be replaced by the value that you typed in for the app URL.

The app deployment takes less than a minute. To check the status of the deployment, you can click the **Refresh** button. You can also follow along in the deployment process by clicking the triple dot menu on the right-hand side of your app entry, and clicking "View Logs". Once the app has finished deploying, you can click on its entry under the "App Deployment" menu item to go to your new app, as shown below:

[check_todos_flask_app-2024-01-22_15.52.06.webm](https://github.com/adamatics/containerize-flask-app/assets/149479200/59f9218c-a477-4c86-9665-25a44c505c44)

# References
The app.py file and templates folder were copied from https://github.com/LetsStartLooping/learning-flask/tree/main/05-user-input and the file requirements.txt was copied from https://github.com/LetsStartLooping/learning-flask/tree/main. Some small modifications were made in this repository after copying.
