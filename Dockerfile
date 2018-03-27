FROM haskell:8

COPY . /opt/net-fortune
WORKDIR /opt/net-fortune

RUN apt-get update && apt-get -y install xz-utils make postgresql libpq-dev
RUN stack upgrade
RUN stack install cabal-install && stack install heist-1.0.1.2 \
    && stack install map-syntax-0.2.0.2 && stack install snap-1.0.0.2 \
    && stack install hspec-snap-1.0.0.2 && stack install digestive-functors-0.8.3.0 \
    && stack install postgresql-libpq-0.9.4.1 && stack install snap \
    && stack install hspec && stack install hspec-snap \
    && stack install hspec-core && stack install snap-core \
    && stack install postgresql-simple && stack install resource-pool
RUN stack build
RUN rm haskell-web-base.cabal
