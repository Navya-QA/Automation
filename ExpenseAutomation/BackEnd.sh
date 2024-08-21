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