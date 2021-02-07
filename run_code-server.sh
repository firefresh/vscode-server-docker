# 

ip=0.0.0.0
complete_ip="$ip:8443"

echo "Code Server"
echo "http://$ip:8443"

docker run -d -p 8443:8080 -p 443:443 -v "$PWD/home:/home" -u "$(id -u):$(id -g)" codercom/code-server:3.4.1



