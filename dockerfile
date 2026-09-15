# Simple static site image using Nginx
FROM nginx:alpine

# Remove default Nginx welcome page
RUN rm -rf /usr/share/nginx/html/*

# Copy site files into Nginx's default serving directory
COPY . /usr/share/nginx/html

# Tell Nginx to use homepage.html as the default page instead of index.html
RUN echo 'server { \
    listen 80; \
    root /usr/share/nginx/html; \
    index homepage.html; \
    location / { \
        try_files $uri $uri/ /homepage.html; \
    } \
}' > /etc/nginx/conf.d/default.conf

# Nginx listens on port 80 by default
EXPOSE 80

# Nginx runs in the foreground by default with this base image
CMD ["nginx", "-g", "daemon off;"]