# elk_server
--------------
Suits only for ubuntu20.04, installing elasticsearch, logstash,  kibana, metricbeat, making metricbeat to redirect all data locally and remotely to kibana dashboard

# metric_client
--------------
Suits for both centos8 and ubuntu20.04 version, installing metricbeat, setting metribeat.yml to configure elasticsearch database as logserver:9200, and starting metricbeat service 

# log_client
--------------
Suits for any Linux Distribution, configuring /etc/rsyslog.d/50-default.conf to redirect its own syslog to remote logserver and restarting service rsyslog

# alert_server
--------------
Suits only for ubuntu20.04, install filebeat and configures it to fetch kibana.log for alert&actions

# https_elasticsearch_server
----------------------------
Suits only for ubuntu20.04, configure elasticsearch to use https

# https_kibana_server
---------------------
Suits only for ubuntu20.04, configure kibana to use https

# https_logstash_server
-----------------------
Suits only for ubuntu20.04, configure logstash to use https

# https_metricbeat_server
-------------------------
Suits only for ubuntu20.04, configure metricbeat server to use https

# https_metricbeat_client
-------------------------
Suits only for ubuntu20.04, configure metricbeat client to use https