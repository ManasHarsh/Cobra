# usage: log <MSG>
function log () {
    local MSG
    MSG="$(date '+[%d.%m.%Y %H.%M.%S %Z]')[${BASH_SOURCE[1]##*/}:${BASH_LINENO[0]}] $*"

    echo "$MSG"

    [[ -f "$SCRIPTS_LOG_FILE" && -w "$SCRIPTS_LOG_FILE" ]] && echo "$MSG" >> "$SCRIPTS_LOG_FILE"

    return 0
}

# Usage: abort <MSG>
function abort () {
    log "$*"

    if [[ $RB_SCRIPT_DEBUG == 1 ]]; then
        log "----------------------------------------"
        local frame=0
        local funcn
        while funcn="$(caller $frame)"; do
            log "trace: $funcn"
            ((frame++));
        done
        log "----------------------------------------"
    fi

    log "Exiting..."
log "=========================================="
    exit 1
}

# usage: abort_on_failure <msg>
function abort_on_failure () {
    local returnCode="$?"

    [[ "$returnCode" != "0" ]] && abort "Error: ${1:-"Process failed, Error code: '$returnCode'"}"
}


# usage: abort_on_malformed_url <url-string>
function abort_on_malformed_url(){
    regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
    if [[ ! $1 =~ $regex ]]; then
        abort "Error: ${2:-"Malformed URL '$1'"}"
    fi
}