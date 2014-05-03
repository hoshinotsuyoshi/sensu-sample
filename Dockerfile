FROM petecheslock/sensu:latest

RUN rm -rf  /etc/sensu

ADD sensu /etc/sensu
RUN chown -R sensu:sensu /etc/sensu
RUN chmod +x -R /etc/sensu
RUN rm -rf /usr/local/bin
RUN ln -s /opt/sensu/embedded/bin /usr/local/bin

RUN wget http://curl.haxx.se/ca/cacert.pem
RUN mv cacert.pem /opt/sensu/embedded/ssl/cert.pem

# below script should be on CMD-instruction?
ADD . /tmp/wd-sensu-sample
RUN cd /tmp/wd-sensu-sample && ruby json_replace.rb

CMD /tmp/start.sh
