# Use official Node.js image as the base image
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build TypeScript files
RUN npm run build

# Expose port 3000 (or any other port your app uses)
EXPOSE 3000

# Define environment variables for connecting to PostgreSQL
ENV POSTGRES_HOST=localhost
ENV POSTGRES_PORT=5432
ENV POSTGRES_DB=mydatabase
ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypassword

# Install PostgreSQL client for interacting with the database
RUN apt-get update && apt-get install -y postgresql-client

# Command to run the application
CMD ["node", "dist/app.js"]
