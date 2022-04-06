FROM node:16.14.2
ENV TZ=Asia/Makassar
ENV YARN_VERSION 1.22.18
RUN yarn policies set-version $YARN_VERSION
RUN npm install pm2 -g
RUN npm install nodemon -g

RUN curl -fSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
    && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
    && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
    && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
    && rm yarn-v$YARN_VERSION.tar.gz

RUN cp /usr/share/zoneinfo/Asia/Makassar /etc/localtime

RUN echo "Asia/Makassar" >  /etc/timezone

RUN rm -f /etc/localtime; ln -s /usr/share/zoneinfo/Asia/Makassar /etc/localtime

RUN apt-get update

# RUN apt-get update && apt-get -y -q install libreoffice libreoffice-writer ure libreoffice-java-common libreoffice-core libreoffice-common openjdk-8-jre fonts-opensymbol hyphen-fr hyphen-de hyphen-en-us hyphen-it hyphen-ru

WORKDIR /home/node/app
COPY . .

CMD ["pm2-runtime", "ecosystem.config.cjs"]