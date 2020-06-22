ENV CIVICRM_UF=Drupal

USER civicrm

ENV PATH="/home/civicrm/.composer/vendor/bin:${PATH}"

RUN cgr drush/drush:~8

RUN mkdir -p /var/www/html/web/sites/default/files

USER root

COPY ./civicrm-docker-entrypoint ./civicrm-docker-init ./civicrm-docker-dump ./civicrm-docker-install /usr/local/bin/

RUN chmod +x /usr/local/bin/civicrm-docker-entrypoint && \
   chmod +x /usr/local/bin/civicrm-docker-init && \
   chmod +x /usr/local/bin/civicrm-docker-dump && \
   chmod +x /usr/local/bin/civicrm-docker-install

COPY --chown=civicrm:civicrm ./settings.php /usr/local/etc/civicrm
COPY --chown=civicrm:civicrm ./civicrm.settings.php /usr/local/etc/civicrm
