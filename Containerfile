FROM alpine

RUN apk add wget curl

RUN curl -s https://api.github.com/repos/Clever/csvlint/releases/latest \
    | grep "browser_download_url.*linux-amd64.tar.gz" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -qi -

RUN tar -xvf csvlint-*.tar.gz

RUN mv csvlint-*/csvlint /bin
