# Use a base Python image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt /app/
RUN pip install -r requirements.txt

# Copy the entire Django project into the container
COPY . /app/

RUN python manage.py collectstatic --noinput

# Expose the port your Django application will run on
EXPOSE 8000

# Command to run your Django application
CMD ["daphne", "-b", "0.0.0.0", "-p", "8000", "unichat.asgi:application"]
