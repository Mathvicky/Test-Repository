# Use the lightweight Nginx Alpine image
FROM nginx:alpine

# Copy all local files (index.html, CSS, etc.) into the Nginx public folder
COPY . /usr/share/nginx/html

# Expose port 80 to access the website
EXPOSE 80
