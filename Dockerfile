FROM alpine:latest

RUN apk add --no-cache bash

WORKDIR /app

# نسخ الملف مباشرة
COPY repocket /app/repocket

RUN chmod +x /app/repocket

# سكريبت التشغيل
RUN echo '#!/bin/bash' > start.sh && \
    echo './repocket -email kikokasia10@outlook.com -api_key dbca7aaf-a941-4d6b-81b5-c30084de7fdb' >> start.sh && \
    chmod +x start.sh

CMD ["./start.sh"]
