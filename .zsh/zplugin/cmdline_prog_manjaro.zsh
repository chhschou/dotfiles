# docker
zinit ice lucid wait id-as'docker-install' \
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

zinit ice lucid wait from"gh-r" as"null" sbin"docker* -> docker-compose"
zinit light docker/compose

