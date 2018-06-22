FROM python:3.6.5-alpine3.6
LABEL AUTHOR="Todor Todorov <todor.todorov@tundra.com>"

# setup additional python environment
RUN pip install --upgrade pip \
    && pip install --upgrade setuptools_scm \
    && pip install https://github.com/jorgebastida/gordon/archive/master.zip \
    && pip install ipython 

RUN set -ex \
    && apk update \
    && apk add autoconf libtool nasm \
    # required for building native npm packages
    && apk add g++ make automake bash zlib-dev libpng-dev \ 
    && apk add nodejs nodejs-npm

# install default NPM packages
RUN npm install -g typescript

# cleanup
RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

ENTRYPOINT [ "" ]
CMD [ "/usr/local/bin/python" ]

