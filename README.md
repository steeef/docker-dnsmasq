# docker-dnsmasq
Debian slim Docker image for dnsmasq

## Running
If you need to bind ports to the host, don't forget to run this with `--cap-add
NET_ADMIN`to bind to the local tcp/udp ports 53.

Since `dnsmasq -k` is set as the `ENTRYPOINT`, you can add whatever arguments
you want to the end of the `docker run` call.

Example:

```
docker run -d -p 53:53/udp -p 53:53/tcp \
  --cap-add=NET_ADMIN \
  steeef/dnsmasq --cache-size=1000 --log-queries
```
