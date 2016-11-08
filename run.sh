#!/bin/sh

main() {
  if [ ! -e "$WERCKER_EPP_TEMPLATE" ]; then
    fail "template not found \"$WERCKER_EPP_TEMPLATE\""
  fi

  download

  TMP_FILE=$(mktemp ./template.XXXXXXXX)

  if [ "$WERCKER_EPP_DEBUG" = "true" ]; then
    debug "./epp $WERCKER_EPP_TEMPLATE > $TMP_FILE"
    debug "cat $TMP_FILE > $WERCKER_EPP_OUTPUT"
  fi

  ./epp "$WERCKER_EPP_TEMPLATE" > "$TMP_FILE"
  cat "$TMP_FILE" > "$WERCKER_EPP_OUTPUT"

  rm ./epp
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
  curl --fail -L --silent "https://github.com/soudy/epp/releases/download/v1.0.0/epp" -O epp
  chmod +x epp
}

main
