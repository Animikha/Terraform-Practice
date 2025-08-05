#!/bin/bash
exec > /var/log/startup-script.log 2>&1
set -x

# Install NGINX
sudo apt-get update
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

# Create a retro arcade-style HTML page
cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Animikha Arcade</title>
  <style>
    body {
      background-color: #000;
      color: #0ff;
      font-family: 'Courier New', Courier, monospace;
      text-align: center;
      padding-top: 100px;
    }
    h1 {
      font-size: 4em;
      color: #ff0;
      text-shadow: 0 0 10px #f0f, 0 0 20px #0ff;
    }
    p {
      font-size: 1.5em;
      color: #0f0;
    }
    .blink {
      animation: blink 1s steps(2, start) infinite;
    }
    @keyframes blink {
      to {
        visibility: hidden;
      }
    }
    .console {
      background: #111;
      border: 2px solid #0ff;
      padding: 20px;
      margin: 40px auto;
      width: 60%;
      border-radius: 10px;
      box-shadow: 0 0 20px #0ff;
    }
  </style>
</head>
<body>
  <h1>👾 Animikha Arcade</h1>
  <p class="blink">Insert Coin to Start</p>
  <div class="console">
    > Booting virtual machine...<br>
    > Loading retro assets...<br>
    > Welcome to the 80s!<br>
    > Status: <span style="color: #0ff;">READY</span>
  </div>
</body>
</html>
EOF
