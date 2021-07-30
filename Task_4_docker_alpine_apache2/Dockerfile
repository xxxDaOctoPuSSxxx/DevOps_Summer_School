# Task 5 run Apache Server on alpine image with custom html page.

# Build on base image
FROM alpine:latest
# Install updates & Apache Server
RUN apk update && apk add apache2
# Change default html page on page in currient folder
COPY index.html /var/www/localhost/htdocs
# Run Apache Server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# Expose HTTP Default port (#80) to outside
EXPOSE 80
