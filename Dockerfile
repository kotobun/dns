FROM ubuntu:focal
RUN apt-get update \
	&& apt-get install -y \
	bind9 \
	bind9utils \
	bind9-doc

EXPOSE 53/tcp
EXPOSE 53/udp

RUN sed -i 's/OPTIONS=.*/OPTIONS="-4 -u bind"/' /etc/default/named
COPY etc/bind/* /etc/bind/
COPY etc/bind/zones/* /etc/bind/zones/
RUN chown root:bind /etc/bind/*
RUN chown -R bind:bind /etc/bind/zones/
COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
ENTRYPOINT [ "/bin/entrypoint.sh" ]
CMD [ "/usr/sbin/named" ]
