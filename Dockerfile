FROM python:3.6.5-alpine3.6
LABEL AUTHOR="Todor Todorov <todor.todorov@tundra.com>"

# setup additional python environment
RUN pip install --upgrade pip \
    && pip install --upgrade setuptools_scm \
    && pip install https://github.com/jorgebastida/gordon/archive/master.zip \
    && pip install ipython 

RUN set -ex \
    && apk update \
    && apk add autoconf libtool nasm git \
    # required for building native npm packages
    && apk add g++ make automake bash zlib-dev libpng-dev \ 
    && apk add nodejs nodejs-npm

# install default NPM packages
RUN npm install -g typescript

# install Java & ammonite for scala scripting
RUN set -ex \
    && apk add curl ncurses openjdk8 \
    && sh -c '(echo "#!/usr/bin/env sh" && curl -L https://github.com/lihaoyi/Ammonite/releases/download/1.1.2/2.12-1.1.2) > /usr/local/bin/amm && chmod +x /usr/local/bin/amm' \
    && mkdir -p ~/.ammonite && curl -L -o ~/.ammonite/predef.sc https://git.io/vHaKQ


# cleanup
RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

ENTRYPOINT [ "" ]
CMD [ "/usr/local/bin/python" ]

