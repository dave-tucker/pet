FROM registry.fedoraproject.org/fedora-toolbox:36
COPY . /pet
RUN cd /pet && ./build.sh && rm -rf /pet /var/cache/dnf
CMD ["/usr/bin/zsh"]

