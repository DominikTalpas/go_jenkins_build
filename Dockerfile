# Use an official Golang runtime as a parent image
FROM golang:latest

# Set the working directory to /app
WORKDIR /go_build_jenkins

# Copy the current directory contents into the container at /app
ADD . /go_build_jenkins

# Build the Go app
RUN  go build -o goapp

# Use an official Nginx image as a parent image
FROM nginx:latest

# Copy the built Golang executable into the Nginx HTML directory
COPY --from=0 /go_build_jenkins/go_build_jenkins /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]

