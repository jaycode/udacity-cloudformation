# Define the directory where the index.html will be placed
WEB_DIR="/var/www/html"

# Create a basic index.html file
cat <<EOF > index.html
<!DOCTYPE html>
<html>
<head>
    <title>It works! Udagram, Udacity</title>
</head>
<body>
    <h1>It works! Udagram, Udacity</h1>
    <p>This website is hosted on Nginx.</p>
</body>
</html>
EOF

# Copy index.html to the Nginx web directory
sudo rm -r $WEB_DIR/index.*
sudo cp index.html $WEB_DIR

# Reload Nginx to apply changes
sudo systemctl reload nginx