#!/bin/bash
exec > /var/log/startup-script.log 2>&1
set -x

# Install NGINX
sudo apt-get update
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

# Create a fish-themed HTML page
cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Animikha's Underwater World</title>
  https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap
  <style>
    body {
      background: linear-gradient(to bottom, #00c6ff, #0072ff);
      font-family: 'Fredoka One', cursive;
      color: #ffffff;
      text-align: center;
      padding-top: 100px;
      overflow: hidden;
    }
    h1 {
      font-size: 3em;
      margin-bottom: 20px;
      text-shadow: 0 0 10px #ffffff;
    }
    .fish {
      font-size: 4em;
      animation: swim 6s infinite linear;
      display: inline-block;
    }
    @keyframes swim {
      0% { transform: translateX(-100%); }
      100% { transform: translateX(100vw); }
    }
    .bubble {
      font-size: 2em;
      animation: floatUp 3s infinite ease-in-out;
      position: absolute;
      bottom: 0;
      left: 50%;
    }
    @keyframes floatUp {
      0% { transform: translateY(0); opacity: 1; }
      100% { transform: translateY(-300px); opacity: 0; }
    }
  </style>
</head>
<body>
  <div class="fish">🐟</div>
  <h1>Welcome to Animikha's Underwater World</h1>
  <p>Explore the depths of imagination.</p>
  <div class="bubble">⚪</div>
</body>
</html>
EOF
