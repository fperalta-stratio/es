FROM docker.elastic.co/elasticsearch/elasticsearch:5.2.1
ADD elasticsearch.yml /usr/share/elasticsearch/config/
USER root
RUN  if [ -n "$MAX_MAP_COUNT" -a -f /proc/sys/vm/max_map_count ]; then  \
        sysctl -q -w vm.max_map_count=$MAX_MAP_COUNT; \ 
     fi
RUN chown elasticsearch:elasticsearch config/elasticsearch.yml
USER elasticsearch
