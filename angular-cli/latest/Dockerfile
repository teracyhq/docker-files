FROM node:6

MAINTAINER hoatle <hoatle@teracy.com>

# credits to https://github.com/emmenko/docker-nodejs-karma 

RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update && apt-get install -y Xvfb google-chrome-stable \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD xvfb.sh /etc/init.d/xvfb
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /etc/init.d/xvfb \
    && chmod +x /entrypoint.sh

ENV DISPLAY :99.0
ENV CHROME_BIN /usr/bin/google-chrome

RUN npm install -g angular-cli && npm cache clean && rm -rf ~/.npm

ENTRYPOINT ["/entrypoint.sh"]
