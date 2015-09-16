
function zaw-src-systemctl-user() {
    title="$(systemctl --user --all list-units | head -1 | sed 's/^ *//g')"
    desc="$(systemctl --user --all list-units | head -n -7 | tail -n +2 | sed -e 's/^[^ a-zA-Z]//g' -e 's/^ *//g')"
    units="$(echo $desc | awk '{print $1}')"
    : ${(A)candidates::=${(f)units}}
    : ${(A)cand_descriptions::=${(f)desc}}
    actions=(\
        zaw-src-systemctl-user-status \
        zaw-src-systemctl-user-start \
        zaw-src-systemctl-user-stop \
        zaw-src-systemctl-user-restart \
    )
    act_descriptions=(\
        "status" \
        "start" \
        "stop" \
        "restart" \
    )
    options=(-t "$title")
}

function zaw-src-systemctl-user-status(){
    BUFFER="systemctl --user status $1"
    zle accept-line
}

function zaw-src-systemctl-user-start(){
    BUFFER="systemctl --user start $1"
    zle accept-line
}

function zaw-src-systemctl-user-stop(){
    BUFFER="systemctl --user stop $1"
    zle accept-line
}

function zaw-src-systemctl-user-restart(){
    BUFFER="systemctl --user restart $1"
    zle accept-line
}

zaw-register-src -n systemctl-user zaw-src-systemctl-user
