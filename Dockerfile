# FROM python:3.12-alpine

# WORKDIR  /app

# COPY requirements.txt /app/

# RUN pip install -r requirements.txt

# COPY . .

# EXPOSE 8000

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
# ////////////////////////////////////////////
# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app/

# Install any dependencies you may have
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose port 8000 (Django's default port)
EXPOSE 8000

# Set environment variables for Django settings (you can change this based on your configuration)
ENV DJANGO_SETTINGS_MODULE=myproject.settings

# Run migrations and start the Django development server (change the manage.py path if needed)
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
