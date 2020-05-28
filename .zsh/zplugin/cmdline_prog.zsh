# git diff
zinit ice lucid wait'1' as"null" sbin"bin/diff-so-fancy; bin/git-dsf;"
zinit light zdharma/zsh-diff-so-fancy

# direnv
zinit ice lucid wait'1' from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
        direnv/direnv

# file navigation -------------
# rg + fzf
zinit ice lucid wait'1' from"gh-r" as"null" for \
  sbin"fzf" junegunn/fzf-bin \
  sbin"ripgrep*/rg" BurntSushi/ripgrep

# nnn
zinit pick"misc/quitcd/quitcd.zsh" sbin make light-mode for jarun/nnn

# tmux + oh-my-tmux (nb use ver"gh-254" for tmux 3.0+) + tmux plugin manager
zinit ice lucid wait'1' make as"null" sbin"tmux" \
  atclone'./autogen.sh; ./configure' \
  atpull'%atclone'
zinit light tmux/tmux

zinit ice lucid wait'1' id-as'gpakosz/tmux' nocompile \
  atclone'ln -sf $PWD/.tmux.conf $HOME/.tmux.conf' \
  atplull'%atclone'
zinit light gpakosz/.tmux

zinit ice lucid wait'1' wait nocompile
zinit light tmux-plugins/tpm
# -----------------------------


 # neovim + vim-plug ---------
zinit ice lucid wait'1' from"gh-r" as"null" sbin"nvim*/bin/nvim"
zinit light neovim/neovim

zinit ice lucid wait'1' \
  atclone'mkdir -p ~/.local/share/nvim/site/autoload; \
  ln -sf "$PWD/plug.vim" ~/.local/share/nvim/site/autoload/plug.vim' \
  atpull'%atclone'
zinit light junegunn/vim-plug
# -----------------------------

case `uname` in
  Darwin)
    ;;
  Linux)
    # github cli
    zinit ice lucid wait'1' from"gh-r" bpick'*amd64.tar.gz' as'null' sbin'**/gh'
    zinit light cli/cli

    # docker
    zinit ice lucid wait'1' id-as'docker-install' \
      mv'docker-install* -> docker.tgz' \
      atclone'tar xzvf *.tgz; rm *.tgz;' \
      atpull'%atclone' \
      as'null' sbin'docker/containerd; docker/dockerd; docker/docker'
    zinit snippet "https://download.docker.com/linux/static/stable/x86_64/docker-19.03.4.tgz"

    # # dockerd-rootless.sh --experimental
    # zinit ice lucid wait'1' id-as'dockerd-rootless' as"program" \
    #   mv'dockerd-rootless* -> dockerd-rootless.tgz' \
    #   atclone'tar xzvf *.tgz; rm *.tgz;' \
    #   atpull'%atclone' \
    #   sbin'docker-rootless-extras/rootlesskit' sbin'docker-rootless-extras/vpnkit' \
    #   atload'docker-rootless-extras/dockerd-rootless.sh --experimental'
    # zinit snippet "https://download.docker.com/linux/static/stable/x86_64/docker-rootless-extras-19.03.4.tgz"

    zinit ice lucid wait'1' from"gh-r" as"null" sbin"docker* -> docker-compose"
    zinit light docker/compose

    # zinit ice lucid wait'1' id-as'kubectl' as"null" sbin"kubectl"
    # zinit snippet https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
    ;;
esac

