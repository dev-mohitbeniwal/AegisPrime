#!/bin/sh

# Replace environment variables in the Nginx configuration template
envsubst '$HTTP_PORT,$HTTPS_PORT,$DOMAIN_NAME,$SSL_CERT_NAME,$SSL_CERT_KEY_NAME' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

cat /etc/nginx/conf.d/default.conf

# Start Nginx
exec nginx -g 'daemon off;'
