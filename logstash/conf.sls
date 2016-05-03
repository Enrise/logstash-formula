{%- set configfile = salt['pillar.get']('logstash:config_file') %}

{% if configfile is defined %}
/etc/logstash/conf.d/logstash.conf:
  file.managed:
    - source: {{ configfile  }}
    - watch_in:
      - service: logstash
    - require_in:
      - service: logstash
{% endif %}
