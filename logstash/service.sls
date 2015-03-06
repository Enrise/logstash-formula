# Ensure that Logstash is running
extend:
  logstash:
    service.running:
      - enable: True
      - watch:
        - pkg: logstash
      - require:
        - pkg: logstash
