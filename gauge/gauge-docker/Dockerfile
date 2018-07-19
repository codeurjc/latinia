FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

# Install Java
RUN apt-get update && apt-get install -qqy \
    default-jdk \
    maven \
    apt-transport-https \
    software-properties-common \
    xvfb \
    supervisor \
    wget

# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update -qqy \
  && apt-get -qqy install \
    google-chrome-stable \
  && rm /etc/apt/sources.list.d/google-chrome.list
COPY wrap_chrome_binary /opt/bin/wrap_chrome_binary
RUN /opt/bin/wrap_chrome_binary

# Install gauge
RUN apt-key adv --keyserver hkp://pool.sks-keyservers.net:80 --recv-keys 023EDB0B && \
    echo deb https://dl.bintray.com/gauge/gauge-deb stable main > /etc/apt/sources.list.d/gauge.list && \
    apt-get update && \
    apt-get install gauge

# Install gauge plugins
RUN gauge install java && \
    gauge install screenshot

ENV PATH=$HOME/.gauge:$PATH
ENV DISPLAY :99.0

# Cleanup
RUN apt-get autoremove --purge

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]