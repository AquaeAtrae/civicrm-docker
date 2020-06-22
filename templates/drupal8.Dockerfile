ENV CIVICRM_UF=Drupal

USER civicrm

ENV PATH="/home/civicrm/.composer/vendor/bin:${PATH}"

RUN cgr drush/drush:~8

RUN mkdir /var/www/html/web/sites/default/files

USER root

CMD touch /usr/local/bin/civicrm-docker-entrypoint

COPY ./civicrm-docker-init ./civicrm-docker-dump ./civicrm-docker-install /usr/local/bin/

RUN chmod +x /usr/local/bin/civicrm-docker-entrypoint && \
   chmod +x /usr/local/bin/civicrm-docker-init && \
   chmod +x /usr/local/bin/civicrm-docker-dump && \
   chmod +x /usr/local/bin/civicrm-docker-install
