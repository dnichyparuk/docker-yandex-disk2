FROM ubuntu:16.04

MAINTAINER Dzmitry Nichyparuk

RUN apt-get update \

    && apt-get install -y gnupg wget \

    && echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" | tee -a /etc/apt/sources.list.d/yandex.list > /dev/null \
    && wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | apt-key add - \
    && apt-get update \
    && apt-get install -y yandex-disk \

    # Cleanup to keep the images size small
    && apt-get purge -y \
    && apt-get autoremove -y \
    && rm -r /var/lib/apt/lists/* \
	&& mkdir /yandex_disk

# Copy start script
COPY start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
