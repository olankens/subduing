#!/bin/sh

baseurl='https://raw.githubusercontent.com/olankens/subduing/HEAD/source'
deposit='.github/hooks' && mkdir -p "$deposit"
curl -fsSL "$baseurl/commit-msg" -o "$deposit/commit-msg"
chmod +x "$deposit/commit-msg" && git config --local core.hooksPath "$deposit"
