# Use the redhattraining/httpd-parent image as base
FROM quay.io/igalvarezacn/httpd-parent

# Change the port to 8080
EXPOSE 8080
ENV docroot=/var/www/html

# Labels consumed by OpenShift
LABEL io.k8s.description="A basic Apache HTTP Server child image, uses ONBUILD" \
       io.k8s.display-name="Apache HTTP Server" \
       io.openshift.expose-services="8080:http" \
       io.openshift.tags="apache, httpd"

# Change web server port to 8080
RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf

RUN touch /tmp/test
RUN chmod 777 /tmp/test
RUN echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX >> /tmp/test
RUN /usr/bin/touch /tmp/israaaaaaaaaaaaaaaaaaaaa
RUN echo one >> ${docroot}/index.html

ONBUILD cp -R src/ ${docroot}/

# Run as a non-privileged user
USER 1001
