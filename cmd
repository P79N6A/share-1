go get -d -v ./...

go get  golang.org/x/tools/cmd/guru
go get  golang.org/x/tools/cmd/godoc
go get  golang.org/x/tools/cmd/gorename
go get  golang.org/x/lint/golint
go get  golang.org/x/tools/cmd/goimports
go get  github.com/ramya-rao-a/go-outline
go get  github.com/acroca/go-symbols
go get  github.com/josharian/impl
go get  github.com/rogpeppe/godef
go get  github.com/sqs/goreturns
go get  github.com/cweill/gotests
go get  golang.org/x/lint/golint
go get  github.com/zmb3/gogetdoc
go get  github.com/kisielk/errcheck
go get  honnef.co/go/tools/cmd/keyify 
go get  github.com/derekparker/delve/cmd/dlv
go get  github.com/nsf/gocode
go get  github.com/alecthomas/gometalinter
go get  github.com/jstemmer/gotags
go get golang.org/x/tools/cmd/gopls


go get -u gen/stress                                                                                
go get -u gen/thrifttest                                                                            
go get -u github.com/DataDog/datadog-go/statsd                                                      
go get -u github.com/cactus/go-statsd-client/statsd                                                 
go get -u github.com/chzyer/readline                                                                
go get -u github.com/coreos/go-systemd/journal                                                      
go get -u github.com/djherbis/buffer                                                                
go get -u github.com/djherbis/nio                                                                   
go get -u github.com/hashicorp/go-sockaddr                                                          
go get -u github.com/hashicorp/memberlist                                                           
go get -u github.com/ianlancetaylor/demangle                                                        
go get -u github.com/inconshreveable/log15                                                          
go get -u github.com/oklog/ulid                                                                     
go get -u github.com/pierre                                                                         
go get -u github.com/pierrec/cmdflag                                                                
go get -u github.com/pkg/sftp                                                                       
go get -u github.com/rs/xid                                                                         
go get -u github.com/schollz/progressbar/v2                                                         
go get -u github.com/stathat/go                                                                     
go get -u github.com/urfave/negroni                                                                 
go get -u github.com/xdg/scram                                                                      
go get -u github.com/xordataexchange/crypt/config                                                   
go get -u gopkg.in/jcmturner/goidentity.v3                                                                                                                             
go get -u sourcegraph.com/sourcegraph/appdash-data   
go get -u code.cloudfoundry.org/bytefmt     


git lfs install
git lfs track "*.tgz"
git lfs ls-files 

git rm -r --cached .

mv src/google.golang.org/api/.git src/google.golang.org/api/.gitbak
git lfs track src/google.golang.org/api/.gitbak/objects/pack/pack-f697d34c3d788254a72dcadff6d1fa0be714e13e.pack
git rm --cached src/google.golang.org/api/.gitbak/objects/pack/pack-f697d34c3d788254a72dcadff6d1fa0be714e13e.pack
mv src/google.golang.org/api/.gitbak src/google.golang.org/api/.git


4fb82e797aafb9e9272c5cdc123976b0


git config --global user.email "tiger@xiedeacc.com"
git config --global user.name "xiedeacc"


/Users/mac/go/bin/gopackages /Users/mac/go/bin/gopls
/Users/mac/go/bin/gopkgs     /Users/mac/go/bin/gopm
/Users/mac/go/bin/goplay

go get  golang.org/x/tools/gopackages
go get  golang.org/x/tools/gopkgs
go get  golang.org/x/tools/goplay
go get  golang.org/x/tools/gopls
go get  golang.org/x/tools/gopm



git submodule update --init --recursive


cd /root/src/software/getipaddress && ifconfig | grep inet | head -1 | awk '{print $2}' > log && git add . && git commit -m "$(date)"
if test  "x$(curl -I -s --connect-timeout 10 www.baidu.com -w %{http_code} | tail -n1)" = "x200"; then reboot;  fi;

 sar -n DEV 1 100



sudo ./configure --with-features=huge --enable-multibyte --enable-rubyinterp --enable-pythoninterp --enable-python3interp --enable-luainterp --enable-cscope --enable-gui=gtk3 --enable-perlinterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu/ --prefix=/usr/local/vim
sudo 
make

sudo make instal

systemctl set-default multi-user.target
systemctl set-default graphical.target

git config --global --unset http.proxy
git config --global --unset https.proxy


https://commandcenter.blogspot.com/2014/01/self-referential-functions-and-design.html







