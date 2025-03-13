FROM ubuntu:22.04

RUN apt-get update && apt-get install -y sudo

COPY build/factorial_1.0-1_amd64 /tmp/factorial

RUN dpkg -i /tmp/factorial/usr/bin/first || apt-get install -f -y

RUN echo "5" | /usr/bin/first

CMD ["/usr/bin/first"]
