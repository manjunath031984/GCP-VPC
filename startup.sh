#!/bin/bash
set -euxo pipefail

apt-get update -y
apt-get upgrade -y

apt-get install -y apache2

systemctl enable apache2
systemctl restart apache2

cat >/var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
<title>Apache2 on Google Cloud</title>
<style>
body {
font-family: Arial, sans-serif;
background-color: #f4f4f4;
text-align:center;
padding-top:80px;
}
h1 {
color:#0F9D58;
}
p {
font-size:20px;
color:#333;
}
</style>
</head>
<body>
<h1>🚀 Apache2 Installed Successfully!</h1>
<p>Welcome to Google Cloud Platform (GCP)</p>
<p>Ubuntu VM is running Apache Web Server.</p>
<p>Startup Script Executed Successfully.</p>
</body>
</html>
EOF

if command -v ufw >/dev/null 2>&1; then
ufw allow 80/tcp || true
fi

systemctl restart apache2

echo "Apache installation completed successfully."
