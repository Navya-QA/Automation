dnf module disable nodejs -y
dnf module enable nodejs:20 -y 
dnf install nodejs -y
useradd expense
mkdir /app 
curl -o /tmp/backend.zip https://expense-web-app.s3.amazonaws.com/backend.zip 
cd /app 
npm install
unzip /tmp/backend.zip

cp BackEnd.sh /etc/systemd/system/backend.service

echo "Creating service account"
 chmod -R 775 /app
chown -R expense:expense /app