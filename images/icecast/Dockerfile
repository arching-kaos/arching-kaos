FROM fedora
RUN dnf install -y icecast 
COPY icecast.xml /etc/icecast.xml
EXPOSE 8000
ENTRYPOINT ["su", "-s", "/bin/bash", "-c", "icecast -c /etc/icecast.xml", "icecast"]

