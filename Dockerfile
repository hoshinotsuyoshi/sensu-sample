FROM petecheslock/sensu:latest

# replace original /etc/sensu
RUN rm -rf  /etc/sensu
ADD sensu /etc/sensu

# make /etc/sensu dir executable
RUN chown -R sensu:sensu /etc/sensu
RUN chmod +x -R /etc/sensu

# use sensu-embedded-ruby like systems-ruby
RUN rm -rf /usr/local/bin
RUN ln -s /opt/sensu/embedded/bin /usr/local/bin

# use curl-haxx-se's pem
RUN wget http://curl.haxx.se/ca/cacert.pem
RUN mv cacert.pem /opt/sensu/embedded/ssl/cert.pem

# install gem 'mail' (to use plugins/mailer.rb)
RUN gem install mail

# below script should be on CMD-instruction?
ADD . /tmp/wd-sensu-sample
  # json-replasing-with-heroku's env-key
RUN cd /tmp/wd-sensu-sample && ruby json_replace.rb

CMD /tmp/start.sh
