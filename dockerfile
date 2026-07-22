# Use the ultra-lightweight production Nginx server image
FROM nginx:alpine

# Clean up default placeholder server code assets
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML pages out of the subfolder directly into the hosting root directory
COPY src/HTML/ /usr/share/nginx/html/

# Copy your CSS files over while keeping the folder structure intact
COPY src/CSS/ /usr/share/nginx/html/CSS/

# Overwrite the standard configuration with our clean URL routing config file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose network communication port 80
EXPOSE 80

# Keep the web server running in the foreground
CMD ["nginx", "-g", "daemon off;"]
