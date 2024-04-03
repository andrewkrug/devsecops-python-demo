FROM ubuntu:20.04
RUN mkdir -p /app
WORKDIR /app
COPY . .
RUN apt-get update && apt-get install python3 python3-dev python3-pip -y
RUN pip3 install poetry
RUN poetry install
RUN python3 -m pip install semgrep
RUN pip3 install --upgrade zapcli requests
RUN export DEBIAN_FRONTEND=noninteractive && apt install curl default-jre -y
RUN echo 'deb http://download.opensuse.org/repositories/home:/cabelo/xUbuntu_20.04/ /' | tee /etc/apt/sources.list.d/home:cabelo.list
RUN curl -fsSL https://download.opensuse.org/repositories/home:cabelo/xUbuntu_20.04/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/home_cabelo.gpg > /dev/null
RUN apt update
# RUN apt install owasp-zap
RUN curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin
