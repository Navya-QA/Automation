dnf module disable nodejs -y
dnf module enable nodejs:20 -y 
dnf install nodejs -y
cp Backproxy.conf /etc/systemd/system/backend.service

useradd expense
mkdir /app 
curl -o /tmp/backend.zip https://expense-web-app.s3.amazonaws.com/backend.zip 
cd /app 

unzip -o /tmp/backend.zip
pwd 
ls -ltr


npm install

echo "Creating service account"
 chmod -R 775 /app
chown -R expense:expense /app

dnf install mysql-server -y
mysql -h 54.236.33.130 -uroot -pExpenseApp@1 < /app/schema/backend.sql 
systemctl daemon-reload
systemctl enable backend 
systemctl start backend


echo " BackEnd installation successful"

