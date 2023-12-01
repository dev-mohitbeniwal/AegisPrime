FROM nginx:latest

# Copy the configuration file template and the setup script to the container
COPY ./conf.d/default.conf.template /etc/nginx/conf.d/default.conf.template
COPY ./setup.sh /usr/local/bin/setup.sh

# Make the setup script executable
RUN chmod +x /usr/local/bin/setup.sh

# Set the setup script as the entrypoint
ENTRYPOINT ["/usr/local/bin/setup.sh"]
