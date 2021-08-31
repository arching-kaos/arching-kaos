FROM fedora
RUN dnf install -y nginx \
        && dnf clean all \
        && rm -rf /var/cache/yum
EXPOSE 80 443
STOPSIGNAL SIGQUIT
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
#ENTRYPOINT ["tail", "-f", "/var/log/nginx/access.log"]
