# cloud9-docker
A Dockerfile repository for the latest Cloud9 Core. This image will update to the latest Cloud9 from GitHub every time it starts.
Cloud9: https://github.com/c9/core

to run:

docker run -d -v $(pwd):/workspace -p 8181:8181 -e USERNAME='test' -e PASSWORD='test' stefand/cloud9-latest

replace $(pwd) with a local volume you want to use as your workspace.

Then open in your browser:
http://[YOUR.DOCKER.IP.ADDRESS]:8181/

and login with the credentials specified above.

If you have a domain/subdomain for your Cloud9 instance, then I recommend using Caddy-proxy to secure your workspace with SSL encryption. First start caddy-proxy if not already running:

docker run -v /var/run/docker.sock:/tmp/docker.sock:ro -v /data/.caddy:/root/.caddy --name caddy-proxy -p 80:80 -p 443:443 -e CADDY_OPTIONS="--email youremail@example.com" -d blackglory/caddy-proxy:latest

Then start cloud9 with -e VIRTUAL_HOST and without -p :

docker run -d -v $(pwd):/workspace -e VIRTUAL_HOST=your-domain-for-cloud9.com -e USERNAME='test' -e PASSWORD='test' stefand/cloud9-latest

As long as you point your-domain-for-cloud9.com to the IP of your Docker host (add DNS record type A), your instance should be available on:

https://your-domain-for-cloud9.com

This is a much more secure way to setup your development environment.
