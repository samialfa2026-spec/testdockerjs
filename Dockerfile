ROM node:18-alpine

WORKDIR /app

RUN apk add --no-cache wget

# تطبيق وهمي
RUN npm init -y && npm install express

RUN cat > server.js << 'EOF'
const express = require('express');
const app = express();
app.get('/', (req, res) => res.send('Service Active'));
app.listen(3000, () => console.log('Started'));
EOF

# تحميل repocket
RUN wget https://download.repocket.co/linux/repocket_linux_amd64.tar.gz && \
    tar -xzf repocket_linux_amd64.tar.gz && \
    chmod +x repocket

# سكريبت التشغيل
RUN cat > start.sh << 'EOF'
#!/bin/sh
node server.js &
sleep 12
./repocket -email kikokasia10@outlook.com -api_key dbca7aaf-a941-4d6b-81b5-c30084de7fdb
EOF

RUN chmod +x start.sh

EXPOSE 3000

CMD ["./start.sh"]
