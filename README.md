# Easy Ingress

**Just Pass request to hostnames**

Create docker network for web applications

```bash
docker network create webNetwork
```

Run web applications with name property

```bash
# Example web app. You can run your own app
docker run --rm -d --name amsterdam-nts.ahmetozer.org --network web ahmetozer/net-tools-service
```

Run docker container with hostname setting. Do not forget to add your network name as a hostname.
This is prevents network outside proxies.

```bash
docker run -d --network webNetwork --hostname webNetwork --restart always -p 80:80 -p 443:443 ahmetozer/easy-ingress
```

With your ssl keys.

```bash
docker run -it --name looking-glass --restart always \
-p 80:80 -p 443:443 \
--mount type=bind,source="myssl.crt",target=/etc/ssl/certs/project.crt,readonly \
--mount type=bind,source="myssl.key",target=/etc/ssl/private/project.key,readonly \
ahmetozer/easy-ingress
```

Port 8443 is forward https requests to http.

```bash
docker run -d --network webNetwork --hostname webNetwork --restart always -p 80:80 -p 443:8443 ahmetozer/easy-ingress
```
