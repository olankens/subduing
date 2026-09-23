#!/bin/bash

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2155

assert_length_between_62_and_70() {

  local payload=$(head -n 1 "$1")
  if [[ ${#payload} -ge 62 && ${#payload} -le 70 ]]; then return 0; fi
  echo "❌ Commit message must be between 62 and 70 characters long"
  echo "Your message is: '$payload' (${#payload})" && exit 1

}

assert_no_scope_or_type() {

  local payload=$(head -n 1 "$1")
  local pattern='^[a-zA-Z]+[[:space:]]*(\([a-zA-Z0-9_-]+\))?!?:'
  if [[ ! "$payload" =~ $pattern ]]; then return 0; fi
  echo "❌ Commit message must not contain scope or type"
  echo "Your message is: '$payload'" && exit 1

}

assert_no_trailing_punctuation() {

  local payload=$(head -n 1 "$1")
  local pattern='[.,;:!?]$'
  if [[ ! "$payload" =~ $pattern ]]; then return 0; fi
  echo "❌ Commit message must not contain trailing punctuation"
  echo "Your message is: '$payload'" && exit 1

}

assert_no_weird_characters() {

  local payload=$(head -n 1 "$1")
  local pattern='[][@#$%^&*{}<>|\\~`]'
  if [[ ! "$payload" =~ $pattern ]]; then return 0; fi
  echo "❌ Commit message must not contain special characters"
  echo "Your message is: '$payload'" && exit 1

}

assert_start_with_capital_letter() {

  local payload=$(head -n 1 "$1")
  if [[ "${payload:0:1}" =~ [A-Z] ]]; then return 0; fi
  echo "❌ Commit message must start with a capital letter"
  echo "Your message is: '$payload'" && exit 1

}

assert_start_with_verb() {

  local payload=$(head -n1 "$1" | awk '{print tolower($1)}' | tr -d '[:punct:]' | tr -d '\r')
  # curl "https://api.dictionaryapi.dev/api/v2/entries/en/$payload" | jq -e 'type=="array" and any(.[].meanings[]?; .partOfSpeech=="verb")' >/dev/null && return 0
  curl -sf "https://api.datamuse.com/words?sp=$payload&md=p" | jq -e 'any(.[]; .word=="'"$payload"'" and any(.tags[]?; .=="v"))' >/dev/null && return 0
  echo "❌ Commit message must start with a verb"
  echo "Your message starts with: '$payload'" && exit 1

}

main() {

  assert_length_between_62_and_70 "$1"
  assert_no_scope_or_type "$1"
  assert_no_trailing_punctuation "$1"
  assert_no_weird_characters "$1"
  assert_start_with_capital_letter "$1"
  assert_start_with_verb "$1"

}

main "$1"
