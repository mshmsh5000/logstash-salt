logstash-salt
=============

## A Logstash-Elasticsearch-Kibana stack built with Vagrant and Salt


Installation
============

- Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
- Install [http://www.vagrantup.com/](Vagrant)
- Install [https://github.com/saltstack/salty-vagrant](Salty Vagrant): `vagrant plugin install vagrant-salt`
- `vagrant up` (This will take a while; Vagrant will download and add the Virtualbox, then Salt will bootstrap and configure the machine)
- `vagrant ssh` to access the machine

Running the Logstash stack
==========================

- From the machine's CLI, `cd /vagrant`
- Download the Logstash [https://download.elasticsearch.org/logstash/logstash/logstash-1.2.2-flatjar.jar](jar) 
  and [http://logstash.net/docs/1.2.2/tutorials/10-minute-walkthrough/apache_log.2.bz2](sample apache file)
- Expand the sample log: `bunzip2 apache_log.2.bz2`
- Run Logstash: `java -jar logstash-1.2.2-flatjar.jar agent -f apache-elasticsearch.conf`
- From a separate command line, feed the Apache log to logstash: `nc localhost 3333 < apache_log.2`
- When this is finished, try loading Kibana at [http://localhost:15001/index.html](http://localhost:15001/index.html)
