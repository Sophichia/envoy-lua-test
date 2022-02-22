FROM mengjial/lua-envoy:v1.18.4-exported-modules

RUN apt-get -y update && \
    apt-get -y install luarocks wget && \
    luarocks install luasocket && \
    wget https://raw.githubusercontent.com/rxi/json.lua/master/json.lua -O /usr/local/share/lua/5.1/json.lua

COPY ./envoy.yaml /etc/envoy/envoy.yaml
ENTRYPOINT ["/usr/local/bin/envoy"]
