{%- set logstash_version = salt['pillar.get']('logstash:repo_version', '1.4') %}

logstash-repo:
  pkgrepo.managed:
    - humanname: Logstash Repo
    - name: deb http://packages.elasticsearch.org/logstash/{{ logstash_version }}/debian stable main
    - file: /etc/apt/sources.list.d/logstash.list
    - keyid: D88E42B4
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: logstash
