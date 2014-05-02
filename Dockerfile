FROM petecheslock/sensu:latest

RUN rm -rf  /etc/sensu

ADD sensu /etc/sensu
RUN chown -R sensu:sensu /etc/sensu
RUN chmod +x -R /etc/sensu
RUN rm -rf /usr/local/bin
RUN ln -s /opt/sensu/embedded/bin /usr/local/bin
CMD /tmp/start.sh
