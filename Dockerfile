FROM dio123/envoy:lua-exported

FROM ubuntu:bionic
COPY --from=0 /usr/local/bin/envoy /usr/bin/envoy
RUN apt-get -y update && \
    apt-get -y install luarocks wget && \
    luarocks install luasocket && \
    wget https://raw.githubusercontent.com/rxi/json.lua/master/json.lua -O /usr/local/share/lua/5.1/json.lua

FROM ubuntu:bionic
COPY --from=0 /usr/local/bin/envoy /usr/local/bin/envoy
COPY --from=1 /usr/local/lib/lua/5.1 /usr/local/lib/lua/5.1
COPY --from=1 /usr/lib/x86_64-linux-gnu/lua/5.3 /usr/lib/x86_64-linux-gnu/lua/5.3
COPY --from=1 /usr/local/share/lua/5.1 /usr/local/share/lua/5.1
COPY ./envoy.yaml /etc/envoy/envoy.yaml
ENTRYPOINT ["/usr/local/bin/envoy"]
