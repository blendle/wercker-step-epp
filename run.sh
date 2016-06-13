#!/bin/sh
#shellcheck disable=2086,2089,SC2090

main() {
  args=""

  if [ ! -e "$WERCKER_KTMPL_TEMPLATE" ]; then
    fail "template not found \"$WERCKER_KTMPL_TEMPLATE\""
  fi

  if [ -n "$WERCKER_KTMPL_PARAMETERS" ]; then
    args="--parameter $WERCKER_KTMPL_PARAMETERS"
  fi

  if [ -n "$WERCKER_KTMPL_BASE64_PARAMETERS" ]; then
    args="$args --base64-parameter $WERCKER_KTMPL_BASE64_PARAMETERS"
  fi

  download

  if [ "$WERCKER_KTMPL_DEBUG" = "true" ]; then
    debug "./ktmpl $WERCKER_KTMPL_TEMPLATE $args > $WERCKER_KTMPL_OUTPUT"
  fi

  ./ktmpl "$WERCKER_KTMPL_TEMPLATE" $args > "$WERCKER_KTMPL_OUTPUT"

  rm ktmpl
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
  version="$WERCKER_KTMPL_VERSION"
  type=$(uname -s | awk '{print tolower($0)}')
  curl --fail --location --silent "https://github.com/InQuicker/ktmpl/releases/download/$version/ktmpl-$version-$type.tar.gz" | tar -xz
  chmod +x ktmpl
}

main
