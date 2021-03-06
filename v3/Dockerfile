FROM fedora:27
MAINTAINER Capuccino <chinodesuuu@gmail.com>

# Use a script to configure the container. This way we can
# split up the operations and do it all in a single layer.
ADD run_container.sh /tmp/
RUN chmod +x /tmp/run_container.sh
RUN /tmp/run_container.sh

EXPOSE 8181

ENV USERNAME ""
ENV PASSWORD ""
ENV HOME "/home/user/"

ADD run_usercommand.sh /tmp/
ADD entrypoint /home/user
ADD entrypoint /home/user
RUN chgrp -R 0 /home/user && \
    chmod a+x /home/user/entrypoint && \
    chmod -R g=u /home/user && \
    chmod g=u /etc/passwd;
RUN chmod +x /tmp/run_usercommand.sh

VOLUME ["/workspace"]
USER 10001
ENTRYPOINT ["/home/user/entrypoint"]
CMD ["/tmp/run_usercommand.sh"]

# Labels for Kubernetes, OpenShift and Atomic
LABEL io.k8s.description="A powerful IDE for the cloud under your control! C9 SDK based on CentOS, Fedora or Ubuntu" \
      io.k8s.display-name="Cloud9 IDE" \
      io.openshift.expose-services="8181:http" \
      io.openshift.tags="ide,development" \
      io.projectatomic.nulecule.environment.optional="USERNAME, PASSWORD" \
      io.projectatomic.nulecule.volume.data="/workspace,1Gi"
