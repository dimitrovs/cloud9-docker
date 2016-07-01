# cloud9-docker
A Dockerfile repository for the latest Cloud9 Core. This image will update to the latest Cloud9 from GitHub every time it starts.
Cloud9: https://github.com/c9/core

to run:

docker run -d -v $(pwd):/workspace -p 8181:8181 -e USERNAME='test' -e PASSWORD='test' stefand/cloud9-latest

replace $(pwd) with a local volume you want to use as your workspace.

Then open in your browser:
http://[YOUR.DOCKER.IP.ADDRESS]:8181/

and login with the credentials specified above.
