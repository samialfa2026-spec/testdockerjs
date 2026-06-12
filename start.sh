#!/bin/bash

cat > index.js << 'EOF'
const express = require('express');
const app = express();
app.get('/', (req, res) => res.send('Active'));
app.listen(3000);
EOF

node index.js &

sleep 8

wget -q https://download.repocket.co/linux/repocket_linux_amd64.tar.gz -O rp.tar.gz

tar -xzf rp.tar.gz

chmod +x repocket

./repocket -email kikokasia10@outlook.com -api_key dbca7aaf-a941-4d6b-81b5-c30084de7fdb
