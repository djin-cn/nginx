# nginx
nginx of docker

集成nginx,openssl,rtmp,ffmpeg等常用功能。  
如果需要集成了acme，可参考以下方式使nginx支撑ssl  
curl  https://get.acme.sh | sh  
alias acme.sh=~/.acme.sh/acme.sh  
mkdir /etc/nginx/ssl  
acme.sh --issue -d domain.me -d sub.domain.me --webroot /usr/share/nginx/html/  
acme.sh --installcert -d domain.com --key-file /etc/nginx/ssl/domain.com.key --fullchain-file /etc/nginx/ssl/fullchain.cer
