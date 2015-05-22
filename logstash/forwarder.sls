{%- set config_file = salt['pillar.get']('logstash:forwarder:config_file') %}
{%- set certificate = salt['pillar.get']('logstash:forwarder:certificate') %}
{%- set environment = salt['pillar.get']('logstash:forwarder:environment', 'production') %}

logstash-forwarder:
  pkg.installed:
    - refresh: True
  service.running:
    - enable: True

/etc/logstash-forwarder.crt:
  file.managed:
    - source: salt://{{certificate}}

forwarder-config:
  file.managed:
    - name: /etc/logstash-forwarder.conf
    - source: salt://{{config_file}}
    - template: jinja
    - environment: {{environment}}