sudo mkdir -p "/dlinkac/tftp"
apt-get -y install libnet-telnet-cisco-perl libnet-telnet-perl xinetd tftpd unzip

sudo chmod -R 777 /dlinkac/tftp
sudo chown -R nobody /dlinkac/tftp
cat > /etc/xinetd.d/tftp << EOF
service 
tftp
{
  protocol = udp
  port= 69
  socket_type     = dgram
  wait            = yes
  user            = nobody
  server          = /usr/sbin/in.tftpd
  server_args     = /dlinkac/tftp
  disable         = no
}
EOF
sudo /etc/init.d/xinetd restart