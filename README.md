This docker image is based on datagovsg/python-node image and does the following:

- upgrades pip
- installs ipython

## Building and releasing

    docker build -t tundradotcom/python-node:3.6-6.10.3 .
    docker push tundradotcom/python-node:3.6-6.10.3

## Run this image

    docker run -it tundradotcom/python-node:3.6-6.10.3
