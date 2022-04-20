#!/bin/bash

# install golang
curl -LO https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.1.linux-amd64.tar.gz
if [ $? -ne 0 ]; then
  exit 1
fi
export PATH=$PATH:/usr/local/go/bin

# install vim-go
git clone https://github.com/fatih/vim-go.git /root/.local/share/nvim/site/pack/plugins/start/vim-go
# install vim-go binaries
# taken from https://github.com/fatih/vim-go/blob/master/plugin/go.vim
go install -v -mod=readonly github.com/klauspost/asmfmt/cmd/asmfmt@latest
go install -v -mod=readonly github.com/go-delve/delve/cmd/dlv@latest
go install -v -mod=readonly github.com/kisielk/errcheck@latest
go install -v -mod=readonly github.com/davidrjenni/reftools/cmd/fillstruct@master
go install -v -mod=readonly github.com/rogpeppe/godef@latest
go install -v -mod=readonly golang.org/x/tools/cmd/goimports@master
go install -v -mod=readonly github.com/mgechev/revive@latest
go install -v -mod=readonly golang.org/x/tools/gopls@latest
go install -v -mod=readonly github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install -v -mod=readonly honnef.co/go/tools/cmd/staticcheck@latest
go install -v -mod=readonly github.com/fatih/gomodifytags@latest
go install -v -mod=readonly golang.org/x/tools/cmd/gorename@master
go install -v -mod=readonly github.com/jstemmer/gotags@master
go install -v -mod=readonly golang.org/x/tools/cmd/guru@master
go install -v -mod=readonly github.com/josharian/impl@master
go install -v -mod=readonly honnef.co/go/tools/cmd/keyify@master
go install -v -mod=readonly github.com/fatih/motion@latest
go install -v -mod=readonly github.com/koron/iferr@master

# install auto-completion
# git clone https://github.com/Shougo/deoplete.nvim /root/.local/share/nvim/site/pack/plugins/start/deoplete

# install nerdtree
git clone https://github.com/preservim/nerdtree.git /root/.local/share/nvim/site/pack/plugins/start/nerdtree
