FROM python:3.10-slim-buster

WORKDIR /app

COPY requirements.txt /app
RUN pip3 install -r requirements.txt

EXPOSE 5000

COPY . /app

# Define the environment variables for Flask
ENV FLASK_APP=app.py
ENV FLASK_ENV=production
ENV FLASK_RUN_DEBUG=false
# To make the links between pages in the app work, the argument 
# '--env SCRIPT_NAME=/apps/{app-url}' needs to be passed, and the
# SCRIPT_NAME must match the URL that the app is deployed at. All
# containerized apps in AdaLab are deployed on <adalab_base_url>/apps/.
# That is, if you want your app to be accessible at 
# <adalab_base_url>/apps/{app-url}, the start command should be
CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:5000", "--env", "SCRIPT_NAME=/apps/flask-api", "app:app"]