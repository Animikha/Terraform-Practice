#!/bin/bash
exec > /var/log/startup-script.log 2>&1
set -x

# Install NGINX
sudo apt-get update
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

# Create a futuristic tech-themed HTML page
cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Animikha Cloud</title>
  <style>
    body {
      background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
      color: #ffffff;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      text-align: center;
      padding-top: 100px;
    }
    h1 {
      font-size: 3.5em;
      margin-bottom: 20px;
      color: #00e5ff;
    }
    p {
      font-size: 1.5em;
      color: #b2ebf2;
    }
    .glow {
      text-shadow: 0 0 10px #00e5ff, 0 0 20px #00e5ff, 0 0 30px #00e5ff;
    }
    .terminal {
      background-color: #1e1e1e;
      color: #00ff00;
      padding: 20px;
      margin: 40px auto;
      width: 60%;
      border-radius: 10px;
      font-family: monospace;
      text-align: left;
    }
  </style>
</head>
<body>
  <h1 class="glow">Welcome to Animikha Cloud</h1>
  <p>🚀 Your virtual machine is live and ready to deploy magic.</p>
  <div class="terminal">
    > Initializing system...<br>
    > Loading modules...<br>
    > Launch successful.<br>
    > Status: <span style="color: #00ff00;">ONLINE</span>
  </div>
</body>
</html>
EOF
