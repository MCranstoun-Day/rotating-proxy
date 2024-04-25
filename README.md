tor-rotating-proxy
=====================

[![Docker Pulls](https://img.shields.io/docker/pulls/shaddysignal/tor-rotating-proxy.svg)](https://hub.docker.com/r/shaddysignal/tor-rotating-proxy/)

```
               Docker Container
               --------------------------
                        <-> Tor Proxy 1
Client <---->  HAproxy  <-> Tor Proxy 2
                        <-> Tor Proxy n
```

__Why:__ Lots of IP addresses. One single endpoint for your client.
Load-balancing by HAproxy.

Usage
-----

```bash
# build docker container
docker build -t shaddysignal/tor-rotating-proxy:latest .

# ... or pull docker container
docker pull shaddysignal/tor-rotating-proxy:latest

# start docker container
docker run -d -p 9050:9050 -p 4444:4444 --env tors=8 shaddysignal/tor-rotating-proxy # default tors=10

# test with ...
curl -x socks5://127.0.0.1:9050 http://api4.my-ip.io/ip
or
curl -vx socks5://127.0.0.1:5566 https://api.ipify.org?format=json
response: {"ip":"X.X.X.X"}* Connection #0 to host 127.0.0.1 left intact

# monitor
http://127.0.0.1:4444/haproxy?stats
```


Further Readings
----------------

 * [Tor Manual](https://www.torproject.org/docs/tor-manual.html.en)
 * [Tor Control](https://www.thesprawl.org/research/tor-control-protocol/)
 * [HAProxy Manual](http://cbonte.github.io/haproxy-dconv/configuration-1.5.html)

--------------

Thanks to mattes/rotating-proxy. Although it is a fork, so its obvious.
