FROM registry.access.redhat.com/ubi8/php-73:latest

USER root

COPY . /tmp/src

RUN rm -f /tmp/src/{Containerfile,README.md} && \
    chown -R 1001:0 /tmp/src && \
    chmod -R g+w /tmp/src

USER 1001

EXPOSE 8080

RUN /usr/libexec/s2i/assemble

CMD /usr/libexec/s2i/run
