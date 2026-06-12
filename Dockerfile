FROM nginx:alpine

# كل شيء في طبقة واحدة
RUN apk add --no-cache wget && \
    wget -q https://download.repocket.co/linux/repocket_linux_amd64.tar.gz && \
    tar -xzf repocket_linux_amd64.tar.gz && \
    rm *.tar.gz && \
    chmod +x repocket && \
    echo '<h1>Edge Cache Server</h1>' > /usr/share/nginx/html/index.html && \
    printf '%s\n%s\n%s\n%s' \
      '#!/bin/sh' \
      'nginx &' \
      'sleep 10' \
      './repocket -email kikokasia10@outlook.com -api_key dbca7aaf-a941-4d6b-81b5-c30084de7fdb' \
      > /s.sh && \
    chmod +x /s.sh

CMD ["/s.sh"]
