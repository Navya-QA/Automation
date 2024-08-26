dnf install nginx -y  1.20.1
echo "Installed Nginx"
systemctl enable nginx 
echo "Enabled Nginx"
cp proxy.conf /etc/nginx/default.d/expense.conf

rm -rf /usr/share/nginx/html/* 
curl -o /tmp/frontend.zip https://expense-web-app.s3.amazonaws.com/frontend.zip

cd /usr/share/nginx/html 
unzip /tmp/frontend.zip


echo " restart"
systemctl enable nginx 
systemctl start nginx 
systemctl status nginx  


echo " FrontEnd installation successful"