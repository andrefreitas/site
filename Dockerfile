FROM scratch

ADD src /src
ADD server /

WORKDIR /src
ENTRYPOINT ["/server"]
