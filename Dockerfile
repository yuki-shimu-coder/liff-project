#dockerHubから持ってくるImageの指定
FROM node:17.1.0

#使用するnodeのバージョンの指定
ENV NODE_VERSION 17.1.0

#yarnのバージョンを指定
ENV YARN_VERSION=1.22.19

RUN curl -fSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
  && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
  && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
  && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
  && rm yarn-v$YARN_VERSION.tar.gz

# docker内に入った時の初期パスの指定
WORKDIR /front

#ローカル側のファイルをdocker内にコピーする
COPY ./front /front

#コンテナの使用ポート指定
EXPOSE 5173

#コンテナが勝手に終了してしまわないようにする設定
ENV CI=true