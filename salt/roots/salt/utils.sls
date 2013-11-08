{% if grains['os'] == 'Ubuntu' %}

curl:
  pkg:
    - installed

sendmail:
  pkg:
    - installed

git:
  pkg:
    - installed

vim:
  cmd.run:
    - name: sudo apt-get install vim --yes

bash-fix:
  cmd.run:
    - name: sudo mv /bin/sh /bin/sh-dist && sudo ln -s /bin/bash /bin/sh

{% endif %}
