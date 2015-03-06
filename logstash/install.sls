# Install Logstash
{%- set version = salt['pillar.get']('logstash:version') %}

logstash:
  pkg:
    - installed
{%- if version is defined %}
    - version: {{ version }}
{%- endif %}
    - require:
      - pkg: default-jre-headless
