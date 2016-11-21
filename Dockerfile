FROM drush/drush:8-php5

# Add files and folders to container.
ADD ["composer.json", "entrypoint.sh", "/var/work/"]
WORKDIR /var/work

# Install and initialize Behat.
RUN composer install \
    && bin/behat --init

ENV PATH $PATH:/var/work/bin/

ENTRYPOINT ["behat"]
