{% if grains['os'] == 'Ubuntu' %}

default-jre:
  pkg:
    - installed

ant:
  pkg:
    - installed
    - require:
      - pkg: default-jre

apache2-env:
  file.managed:
    - name: /etc/apache2/envvars
    - source: salt://apache2/envvars

apache2:
  pkg:
    - installed
    - require:
      - file: apache2-env
  file.managed:
    - name: /etc/apache2/ports.conf
    - source: salt://apache2/ports.conf
    - require:
      - pkg: apache2

apache2-vhosts:
  file.managed:
    - name: /etc/apache2/sites-available/default
    - source: salt://apache2/vhost.conf
    - require:
      - pkg: apache2

apache2-conf:
  file.managed:
    - name: /etc/apache2/apache2.conf
    - source: salt://apache2/apache2.conf
    - require:
      - file: apache2-vhosts

apache2-mods:
  cmd.run:
    - name: sudo a2enmod rewrite
    - require:
      - file: apache2-conf
      - pkg: php5-pkgs

apache2-restart:
  cmd.run:
    - name: sudo chown -R vagrant:vagrant /var/log/apache2 ; sudo chown -R vagrant:vagrant /var/lock/apache2 ; sudo service apache2 restart
    - require:
      - cmd: apache2-mods  

{% endif %}