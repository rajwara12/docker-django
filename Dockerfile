# Use an official Python image as the base image
FROM python:3

# Set the working directory to /app
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code to the container
COPY . .

# Set environment variables
ENV DJANGO_SETTINGS_MODULE=dockertest.settings

# Run Django migrations
# RUN python manage.py migrate

# Expose port 8000 for the Django app
EXPOSE 8000

# Define the command to run the app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
