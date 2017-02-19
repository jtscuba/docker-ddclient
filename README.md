## Supported tags

- `latest` - built on top of `ubuntu:latest` with ddclient provided in apt-get

## Introduction

Automated build of ubuntu container with preinstalled [ddclient](https://sourceforge.net/projects/ddclient/)
with the easiest way of configuring it using environment variables.

> Note: Specifying passwords with environment variables is not secure. Make sure that
> you are not running this container on some shared hosts.

## Quick start

Example of using it with namecheap (see [How do I configure DDClient?](https://www.namecheap.com/support/knowledgebase/article.aspx/583/11/how-do-i-configure-ddclient)) 

```
docker run -d \
    --env DDCLIENT_CONF_PROTOCOL=namecheap \
    --env DDCLIENT_CONF_SERVER=dynamicdns.park-your-domain.com \
    --env DDCLIENT_CONF_LOGIN=yourdomain.com \
    --env DDCLIENT_CONF_PASSWORD=your.dynamic.dns.password \
    --env DDCLIENT_CONF_HOST=www \
    outcoldman/ddclient
```

## Configuration

Look into [ddclient's wiki](https://sourceforge.net/p/ddclient/wiki/Home/) for
reference, including [Usage](https://sourceforge.net/p/ddclient/wiki/usage/) and
[protocols](https://sourceforge.net/p/ddclient/wiki/protocols/).

### Required parameters

- `DDCLIENT_CONF_PROTOCOL` - protocol
- `DDCLIENT_CONF_SERVER` - server
- `DDCLIENT_CONF_LOGIN` - login
- `DDCLIENT_CONF_PASSWORD` - password

### Optional parameters

- `DDCLIENT_CONF_HOST` - defaults to `@` (as by namecheap configuration)
- `DDCLIENT_CONF_USE` - defaults to `web`, specifies how to get an IP address
- `DDCLIENT_CONF_WEB` - defaults to `https://dynamicdns.park-your-domain.com/getip`,
    uses this url to get an IP address
- `DDCLIENT_CONF_VERBOSE` - defaults to `yes`, verbose output
- `DDCLIENT_CONF_DAEMON` - defaults to `1800`, how often will update
- `DDCLIENT_CONF_SSL` - defaults to `yes`, use secure connection

### Additional configuration parameters

Any additional configuration line can be specified with `DDCLIENT_CONF_1...100`
(use numbers in sequential order), for example

```
docker run ... \
    --env DDCLIENT_CONF_1=syslog=yes \
    --env DDCLIENT_CONF_2=retry=yes \
    outcoldman/ddclient
```

## To build

```
docker build -t outcoldman/ddclient .
```

## License

[MIT](./LICENSE)