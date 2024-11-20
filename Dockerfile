# Use Python 3.6 as a base image
FROM python:3.6
# Copy contents into image
COPY . .
# Install pip dependencies from requirements
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
# Set YOUR_NAME environment variable
ENV YOUR_NAME Neeraj
# Expose the correct port
EXPOSE 5500
# Create an entrypoint
ENTRYPOINT ["python", "app.py"]