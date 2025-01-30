# Step 1: Set the base image
FROM node:16-slim

# Step 2: Specify the maintainer of the image
MAINTAINER Your Name <your.email@example.com>

# Step 3: Set the working directory inside the container
WORKDIR /app

# Step 4: Copy package.json and package-lock.json first to install dependencies
COPY package*.json ./

# Step 5: Install the necessary dependencies
RUN npm install --production

# Step 6: Create the necessary directories for views and public/css inside the container
RUN mkdir -p /app/views /app/public/css

# Step 7: Copy files to appropriate directories inside the container
# - Copy login.ejs to /app/views/
# - Copy style.css to /app/public/css/
COPY login.ejs /app/views/
COPY style.css /app/public/css/

# Step 8: Copy the rest of the application files (server.js)
COPY server.js /app/

# Step 9: Expose the port the app will run on
EXPOSE 8080

# Step 10: Set the user to run the container as (optional)
USER node

# Step 11: Add a label for image metadata
LABEL version="1.0" description="Node.js login page app Docker image"

# Step 12: Define the default command to run the Node.js app
CMD ["npm", "start"]

# Step 13: Define an entrypoint to run the Node.js server
ENTRYPOINT ["node", "server.js"]
