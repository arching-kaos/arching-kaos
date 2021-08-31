FROM fedora
RUN dnf install -y icecast \
	&& dnf clean all \
	&& rm -rf /var/cache/yum
COPY icecast.xml /etc/icecast.xml
EXPOSE 8000
ENTRYPOINT ["su", "-s", "/bin/bash", "-c", "icecast -c /etc/icecast.xml", "icecast"]

