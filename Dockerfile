# Specify the base image. Here, we're using the latest LTS version of Node.js
FROM node:16


# Copy the rest of the application code to the working directory
COPY . .

# Install the application dependencies
RUN npm install

# The application listens on port 5000
EXPOSE 5000

# Command to run the application
CMD ["node", "index.js"]
