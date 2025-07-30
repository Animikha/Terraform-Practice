#!/bin/bash
exec > /var/log/startup-script.log 2>&1
set -x

sudo apt-get update
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Habibi</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      text-align: center;
      margin-top: 100px;
      background-color: #f0f4f8;
    }
    h1 {
      font-size: 3em;
      color: #5c6bc0;
    }
    .heart {
      font-size: 5em;
      color: #e53935;
      animation: pulse 1s infinite;
    }
    @keyframes pulse {
      0% { transform: scale(1); }
      50% { transform: scale(1.2); }
      100% { transform: scale(1); }
    }
  </style>
</head>
<body>
  <h1>Habibi come to Dubai <span class="heart">❤</span></h1>
</body>
</html>
EOF
