
function zaw-src-systemctl() {
    title="$(systemctl list-units | head -1 | sed 's/^ *//g')"
    desc="$(systemctl list-units | head -n -7 | tail -n +2 | sed -e 's/^[^ a-zA-Z]//g' -e 's/^ *//g')"
    units="$(echo $desc | awk '{print $1}')"
    : ${(A)candidates::=${(f)units}}
    : ${(A)cand_descriptions::=${(f)desc}}
    actions=(zaw-src-systemctl-status)
    act_descriptions=("status")
    options=(-t "$title")
}

function zaw-src-systemctl-status(){
    BUFFER="systemctl status $1"
    zle accept-line
}

zaw-register-src -n systemctl zaw-src-systemctl
