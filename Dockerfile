FROM scratch

COPY src /src
COPY server /

WORKDIR /src
ENTRYPOINT ["/server"]
