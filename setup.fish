#!/usr/bin/env fish

function info
        echo ' '(set_color --bold blue)' .. '(set_color normal)'  '$argv
end

function success
        echo [(set_color --bold green)' OK '(set_color normal)] $argv
end

function abort
        echo [(set_color --bold red)ABRT(set_color normal)] $argv
        exit 1
end

adduser cuser -s /usr/bin/fish
    and info "cuser created"
    and echo "cuser ALL=(ALL) ALL" > /etc/sudoers
    and info "cuser is now in the sudoers"
    and success "new sudo user created"
    or abort "can't create new user"

echo "http://dl-cdn.alpinelinux.org/alpine/v3.13/community" >> /etc/apk/repositories
    and success "apk repositories added"
    or abort "can't update apk repositories"

apk update 1>/dev/null
    and success "apk updated"
    or abort "can't update apk"

set dev_tools sudo curl bat vim git htop openrc containerd containerd-openrc

for app in $dev_tools
        apk add $app 1>/dev/null
        info "installation complete for $app"
        or abort "can't install $app"
end
success "all dev tools installed"

info "enable and run containerd service"
    and rc-update add containerd boot 1>/dev/null
    and info "service added"
    and service containerd start 1>/dev/null
    and success "service started"
    or abort "can't start containerd service"

success "all done... please reboot and login as cuser :)"