# Stage 1: Build stage (Development mode)
FROM node:14 AS build

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker's cache
COPY package*.json ./ 

# Install dependencies
RUN npm install

# Copy the rest of the files
COPY . . 

# Build the application for production
RUN npm run build

# Stage 2: Production stage (Nginx)
FROM nginx:alpine

# Copy the build files from the build stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 for the container
EXPOSE 80

# Start Nginx in the background
CMD ["nginx", "-g", "daemon off;"]
