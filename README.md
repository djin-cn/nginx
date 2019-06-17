# nginx
nginx of docker

docker run -dt -p 80:80 -p 443:443 -p 1935:1935 --name nginx a273218159/nginx

集成nginx,openssl,rtmp,ffmpeg,acme等常用功能。 要使用acme，请参考如下步骤

# 方式一：基于nginx,建议此方式
/root/.acme.sh/acme.sh --issue -d domain.com -d sub.domain.com --nginx

# 方式二：基于目录
/root/.acme.sh/acme.sh --issue -d domain.com -d sub.domain.com --webroot /usr/share/nginx/html/

# 最后安装证书
/root/.acme.sh/acme.sh --installcert -d domain.com --key-file /etc/nginx/ssl/domain.com.key --fullchain-file /etc/nginx/ssl/domain.com.cer --reloadcmd "nginx -s reload
