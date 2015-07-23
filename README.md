# cloud9-docker
A Dockerfile repository for the latest Cloud9 Core.

to run:

docker run -d -v $(pwd):/workspace -p 8181:8181 -e USERNAME='test' -e PASSWORD='test' stefand/cloud9-latest

replace $(pwd) with a local volume you want to use as your workspace.
