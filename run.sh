#!/bin/sh

main() {
  if [ ! -e "$WERCKER_EXPENV_TEMPLATE" ]; then
    fail "template not found \"$WERCKER_EXPENV_TEMPLATE\""
  fi

  download

  if [ -n "$WERCKER_EXPENV_PARAMETERS" ]; then
    set -a
    eval "$WERCKER_EXPENV_PARAMETERS"
    set +a
  fi

  if [ "$WERCKER_EXPENV_DEBUG" = "true" ]; then
    debug "./expenv -f $WERCKER_EXPENV_TEMPLATE | tee $WERCKER_EXPENV_OUTPUT"
  fi

  ./expenv -f "$WERCKER_EXPENV_TEMPLATE" > tmp
  cat tmp > "$WERCKER_EXPENV_OUTPUT"

  rm expenv
}

debug() {
  printf "%b%b%b\n" "\e[38m\e[1m" "$1" "\e[m"
}

fail() {
  printf "%b%b%b\n" "\e[1;31m" "failed: $1" "\e[m"
  echo "$1" > "$WERCKER_REPORT_MESSAGE_FILE"
  exit 1
}

download() {
  version=$WERCKER_EXPENV_VERSION
  curl --fail -L --silent "https://github.com/blang/expenv/releases/download/v$version/expenv_amd64.tar.gz" | tar -xz
  chmod +x expenv
}

main
