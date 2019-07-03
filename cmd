git config --global user.email "tiger@xiedeacc.com"
git config --global user.name "xiedeacc"

git config --global --unset http.proxy
git config --global --unset https.proxy

git submodule update --init --recursive

split -b 49M -d -a 1 YouCompleteMe.tgz YouCompleteMe.tgz.
apt install git-lfs
git lfs install
git lfs track YouCompleteMe.tgz 
git lfs pull 
git rm -r --cached .

go get ./...
fileencodings=ucs-bom,utf-8,gb2312,gbk,big5,cp936



环境变量	描述	值示例
http_proxy	为http变量设置代理；默认不填开头以http协议传输	10.0.0.51:8080
user:pass@10.0.0.10:8080
socks4://10.0.0.51:1080
socks5://192.168.1.1:1080
https_proxy	为https变量设置代理；	同上
ftp_proxy	为ftp变量设置代理；	同上
all_proxy	全部变量设置代理，设置了这个时候上面的不用设置	同上
no_proxy	无需代理的主机或域名；

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 100
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 100
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 40
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 40

systemctl set-default multi-user.target
systemctl set-default graphical.target
sar -n DEV 1 100


cd /root/src/software/getipaddress && ifconfig | grep inet | head -1 | awk '{print $2}' > log && git add . && git commit -m "$(date)"
if test  "x$(curl -I -s --connect-timeout 10 www.baidu.com -w %{http_code} | tail -n1)" = "x200"; then reboot;  fi;


https://commandcenter.blogspot.com/2014/01/self-referential-functions-and-design.html

rsync -avz --progress --port=873  xx@ip:/usr/local/ /usr/local  --password-file=/etc/xx.pw


sh make.sh > log 2>& 1
make xxx 2> build_output.txt   只输出错误和警告









