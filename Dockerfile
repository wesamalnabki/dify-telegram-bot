# Use a Python 3.11 slim base image
FROM python:3.11-slim

# Install uv (Ultra Fast Python Package Installer)
RUN pip install --no-cache-dir uv

# Change the working directory to the `app` directory
WORKDIR /app

# Copy the project into the image
COPY src ./src/
COPY .env .env
COPY requirements.txt requirements.txt

# Create a virtual environment using uv and install requirements
RUN uv venv .venv
RUN . /app/.venv/bin/activate && uv pip install --no-cache-dir -r requirements.txt

# Run the app using the virtual environment's Python interpreter
CMD ["/app/.venv/bin/python", "-m", "src.bot"]