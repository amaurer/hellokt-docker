FROM sdhibit/rpi-raspbian

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get clean && \
    apt-get install -y \
    unzip \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

ADD https://nodejs.org/dist/v6.10.0/node-v6.10.0-linux-armv7l.tar.gz /tmp/node-v6.10.0-linux-armv7l.tar.gz
RUN cd /tmp && tar -xzf node-v6.10.0-linux-armv7l.tar.gz && \
    rm /tmp/node-v6.10.0-linux-armv7l.tar.gz && \
    mv /tmp/node-v6.10.0-linux-armv7l /opt/nodejs && \
    ln -s /opt/nodejs/bin/node /usr/bin/node && \
    ln -s /opt/nodejs/bin/npm /usr/bin/npm

ADD https://github.com/amaurer/hellokt/archive/master.zip /tmp/hellokt.zip
RUN unzip /tmp/hellokt.zip -d /opt/ && \
    cd /opt/hellokt-master/ && \
    npm install

WORKDIR /opt/hellokt-master/
CMD ["node","index.js"]