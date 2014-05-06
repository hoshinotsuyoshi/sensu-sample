FROM hoshinotsuyoshi/sensu-base:latest

# replace original /etc/sensu
RUN rm -rf  /etc/sensu
ADD sensu /etc/sensu

# make /etc/sensu dir executable
RUN chown -R sensu:sensu /etc/sensu
RUN chmod +x -R /etc/sensu

ADD . /tmp/wd-sensu-server
CMD cd /tmp/wd-sensu-server && ruby json_replace.rb && /tmp/start.sh
