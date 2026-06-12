FROM alpine:latest

RUN apk add --no-cache wget bash

WORKDIR /app

RUN wget https://download.repocket.co/linux/repocket_linux_amd64.tar.gz
RUN tar -xzf repocket_linux_amd64.tar.gz
RUN rm repocket_linux_amd64.tar.gz
RUN chmod +x repocket

RUN echo '#!/bin/bash' > start.sh
RUN echo './repocket -email kikokasia10@outlook.com -api_key dbca7aaf-a941-4d6b-81b5-c30084de7fdb' >> start.sh
RUN chmod +x start.sh

CMD ["./start.sh"]
