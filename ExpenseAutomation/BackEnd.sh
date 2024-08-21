dnf module disable nodejs -y
dnf module enable nodejs:20 -y 
dnf install nodejs -y
useradd expense
mkdir /app 
curl -o /tmp/backend.zip https://expense-web-app.s3.amazonaws.com/backend.zip 
cd /app 

unzip /tmp/backend.zip

cp Backproxy.conf /etc/systemd/system/backend.service

npm install

echo "Creating service account"
 chmod -R 775 /app
chown -R expense:expense /app