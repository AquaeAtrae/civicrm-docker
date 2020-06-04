ENV CIVICRM_UF=Drupal

USER civicrm

ENV PATH="/home/civicrm/.composer/vendor/bin:${PATH}"

RUN cgr drush/drush:~8

RUN composer create-project drupal/recommended-project:'8.9' \
  /home/civicrm/drupal8

# WORKDIR /home/civicrm/drupal8
# RUN composer require civicrm/civicrm-asset-plugin:'~1.0.0' \
#   pear/pear_exception:'1.0.1 as 1.0.0' \
#   civicrm/civicrm-core:'^5.25' \
#   civicrm/civicrm-packages:'^5.25' \
#   civicrm/civicrm-drupal-8:'^5.25' \
#   --prefer-source

# RUN mkdir /var/www/html/sites/default/files

USER root

# TODO: Prepare a proper entrypoint
CMD touch /usr/local/bin/civicrm-docker-entrypoint

COPY ./civicrm-docker-init ./civicrm-docker-dump ./civicrm-docker-install /usr/local/bin/

RUN chmod +x /usr/local/bin/civicrm-docker-entrypoint && \
   chmod +x /usr/local/bin/civicrm-docker-init && \
   chmod +x /usr/local/bin/civicrm-docker-dump && \
   chmod +x /usr/local/bin/civicrm-docker-install

# COPY --chown=civicrm:civicrm ./settings.php /usr/local/etc/civicrm
# COPY --chown=civicrm:civicrm ./civicrm.settings.php /usr/local/etc/civicrm
