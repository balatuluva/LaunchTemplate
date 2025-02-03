#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo systemctl restart nginx
sudo systemctl enable nginx
echo "<h1>$(cat /etc/hostname)</h1>" >> /var/www/html/index.nginx-debian.html
echo "<h1>US-EAST-1A-SERVERS</h1>" >> /var/www/html/index.nginx-debian.html
# for NLB
---

#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo sed -i 's/<h1>Welcome to nginx!<\/h1>/<h1>Welcome to Homepage<\/h1>/' /var/www/html/index.nginx-debian.html
echo '<a href="https://www.gehana26.fun/movies/">Visit for Movies</a>' | sudo tee -a /var/www/html/index.nginx-debian.html
echo '</div>' | sudo tee -a /var/www/html/index.nginx-debian.html
echo '<br>' | sudo tee -a /var/www/html/index.nginx-debian.html
echo '<a href="https://www.gehana26.fun/shows/">Visit for Shows</a>' | sudo tee -a /var/www/html/index.nginx-debian.html
sudo systemctl restart nginx
sudo systemctl enable nginx
# for ALB