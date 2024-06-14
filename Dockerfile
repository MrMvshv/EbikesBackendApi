FROM python:3.10

WORKDIR /app

COPY requirements.txt .

# Install the dependencies
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Run migrations and collect static files
RUN python ebikesApiProject/manage.py migrate
RUN python ebikesApiProject/manage.py collectstatic --noinput

# Expose the port the app runs on
EXPOSE 8000

# Define environment variable
ENV PORT 8000

# Run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "ebikesApiProject.wsgi"]