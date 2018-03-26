FROM haskell:8

COPY . /opt/net-fortune
WORKDIR /opt/net-fortune

RUN apt-get update && apt-get -y install xz-utils make postgresql libpq-dev
RUN stack upgrade
RUN stack build