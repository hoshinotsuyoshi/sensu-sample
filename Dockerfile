FROM petecheslock/sensu:latest

ADD ./sensu/config.json /etc/sensu/config.json

ADD ./sensu/conf.d/client.json /etc/sensu/conf.d/client.json
ADD ./sensu/conf.d/mailer.json /etc/sensu/conf.d/mailer.json
ADD ./sensu/conf.d/check_load_metrics.json /etc/sensu/conf.d/check_load_metrics.json
ADD ./sensu/conf.d/check_sample.json /etc/sensu/conf.d/check_sample.json
ADD ./sensu/conf.d/check_sshd.json /etc/sensu/conf.d/check_sshd.json

ADD ./sensu/handlers/mailer.rb /etc/sensu/handlers/mailer.rb

ADD ./sensu/plugins/check-procs.rb /etc/sensu/plugins/check-procs.rb
ADD ./sensu/plugins/check-sample.rb /etc/sensu/plugins/check-sample.rb
ADD ./sensu/plugins/load-metrics.rb /etc/sensu/plugins/load-metrics.rb

RUN chown -R sensu:sensu /etc/sensu
RUN chmod +x -R /etc/sensu
CMD /tmp/start.sh
