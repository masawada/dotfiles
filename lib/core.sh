# exports:
# - execute
# - execute_su
# - log_info
# - log_warn
# - log_crit
# - log_debug

execute () {
  cmd="$1"

  log_debug "execute: $cmd"

  if [ "$RUN" == 1 ]; then
    bash -c "$cmd"
  fi
}

execute_su () {
  cmd="$1"

  log_debug "execute_su: $cmd"

  if [ "$RUN" == 1 ]; then
    sudo bash -c "$cmd"
  fi
}

log_info () {
  message="$1"
  echo "[INFO] $message"
}

log_warn () {
  message="$1"
  echo "[WARN] $message" 1>&2
}

log_crit () {
  message="$1"
  echo "[CRIT] $message" 1>&2
}

log_debug () {
  message="$1"
  if [ "$DEBUG" == 1 ]; then
    echo "[DEBUG] $message"
  fi
}
