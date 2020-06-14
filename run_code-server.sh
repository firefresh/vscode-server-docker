# 

ip=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
complete_ip="$ip:8443"

echo "Code Server"
echo "http://$ip:8443"

security_group=$(ec2-metadata -s | cut -d " " -f 2);
aws ec2 authorize-security-group-ingress --group-name $security_group --protocol tcp --port 8443 --cidr 0.0.0.0/0

docker run -d -p 8443:8080 -v "$PWD:/home/coder/project" -u "$(id -u):$(id -g)" codercom/code-server:3.4.1

#version="1.32.0-310"
#wget https://github.com/codercom/code-server/releases/download/$version/code-server-$version-linux-x64.tar.gz
#tar -xvzf code-server-$version-linux-x64.tar.gz
#cd code-server-$version-linux-x64
#chmod +x code-server
#./code-server -p 8443


