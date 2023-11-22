# Use the official Node.js 14.19.3 image
FROM node:14.19.3

# Set the working directory in the container
WORKDIR /usr/src/temp

COPY ./apps/build/meteor.tar.gz .

# Unpack the tar.gz file into /usr/src/app and create the directory if it doesn't exist
RUN mkdir -p /usr/src/app && tar -xzf meteor.tar.gz -C /usr/src/app --strip-components 1

# Remove the tar.gz file (optional, depending on your requirements)
RUN rm meteor.tar.gz

# Set the working directory in the container
WORKDIR /usr/src/app

# # Copy package.json and package-lock.json to the container
# COPY ./apps/meteor/programs/server/package*.json ./

# Install application dependencies
RUN npm install

# # Copy the local files to the container
# COPY . .

# Set environment variables
ENV MONGO_URL='mongodb://user:password@host:port/databasename'
ENV ROOT_URL='http://example.com'
ENV MAIL_URL='smtp://user:password@mailhost:port/'

# Expose the port on which the application will run
EXPOSE 80

# Command to run the application
CMD ["node", "main.js"]
