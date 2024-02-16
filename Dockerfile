# Specify the base image. Here, we're using the latest LTS version of Node.js
FROM node:16

# Create and set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available) to the working directory
COPY package*.json ./

# Install the application dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# The application listens on port 5000
EXPOSE 5000

# Command to run the application
CMD ["node", "app.js"]
