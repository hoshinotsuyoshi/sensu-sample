FROM petecheslock/sensu:latest

RUN rm -rf  /etc/sensu

ADD sensu /etc/sensu
RUN chown -R sensu:sensu /etc/sensu
RUN chmod +x -R /etc/sensu
CMD /tmp/start.sh
