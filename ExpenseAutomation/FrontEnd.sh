dnf install nginx -y  
echo "Installed Nginx"
systemctl enable nginx 
echo "Enabled Nginx"
rm -rf /usr/share/nginx/html/* 
curl -o /tmp/frontend.zip https://expense-web-app.s3.amazonaws.com/frontend.zip

cd /usr/share/nginx/html 
unzip /tmp/frontend.zip

cp proxy.conf /etc/nginx/default.d/expense.conf

systemctl restart nginx 
systemctl status nginx  