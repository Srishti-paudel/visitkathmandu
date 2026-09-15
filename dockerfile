# Simple static site image using Nginx
FROM nginx:alpine
 
# Remove default Nginx welcome page
RUN rm -rf /usr/share/nginx/html/*
 
# Copy site files into Nginx's default serving directory
COPY . /usr/share/nginx/html
 
# Nginx listens on port 80 by default
EXPOSE 80
 
# Nginx runs in the foreground by default with this base image
CMD ["nginx", "-g", "daemon off;"]