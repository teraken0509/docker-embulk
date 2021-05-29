FROM openjdk:8

ENV EMBULK_VERSION 0.9.23

RUN curl --create-dirs -o ~/.embulk/bin/embulk -L "https://dl.embulk.org/embulk-${EMBULK_VERSION}.jar" \
  && chmod +x ~/.embulk/bin/embulk \
  && ln -s ~/.embulk/bin/embulk /bin/embulk


# install dependency gems
RUN embulk gem install representable -v 3.0.4 \
    && embulk gem install faraday -v 0.17.4

# install embulk plugins
RUN embulk gem install embulk-input-mongodb \
    && embulk gem install embulk-filter-expand_json \
    && embulk gem install embulk-output-bigquery
