IPV4_ADDRESS="172.16.96.20/24"
IPV4_GATEWAY="172.16.96.1"
IPV4_DNS="8.8.8.8"
SSH_INTERFACE="eno8np0"
ROCE_INTERFACE="eno7np0"
HOST_NAME="MOC-R4PCC04U36"

sudo nmcli connection modify $SSH_INTERFACE ipv4.method manual ipv4.addresses $IPV4_ADDRESS ipv4.gateway $IPV4_GATEWAY ipv4.dns $IPV4_DNS connection.autoconnect yes
sudo nmcli connection modify $ROCE_INTERFACE ipv4.method link-local connection.autoconnect yes
sudo systemctl restart NetworkManager
sudo hostnamectl set-hostname $HOST_NAME

