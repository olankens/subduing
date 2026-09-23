<div align="center">
  <p><img src=".assets/icon.avif" align="center" width="128"></p>
  <h1><code>SUBDUING</code></h1>
</div>

<table>
  <tbody><tr><td align="center" width="99999"><div>
    <a href="https://olankens.com">WEBSITE</a> ·
    <a href="https://ko-fi.com/olankens">FUNDING</a>
  </div></td></tr></tbody>
  <tbody><tr><td align="center" width="99999">&nbsp;<div>
    Enforce strict Git commit message style by validating every message against opinionated rules. Check structure, length, formatting and the quality for ultrafast agentic workflow with massive throughput.
  </div>&nbsp;</td></tr></tbody>
  <tbody><tr><td align="center" width="99999">
    <a href="https://wikipedia.org/wiki/Bash_(Unix_shell)"><img src=".assets/bash.svg" align="center" width="56"></a>
    <picture><img src=".assets/divider.gif" align="center" height="40" width="1"/></picture>
    <a href="https://git-scm.com"><img src=".assets/git.svg" align="center" width="56"></a>
  </td></tr></tbody>
</table>

## PREVIEWS

<table><tbody><tr><td width="99999">
  <img src=".assets/preview-01.avif" align="center" width="99999">
</td></tr></tbody></table>

## FEATURES

<table>
  <tbody><tr>
    <td width="99999">Length between 62 and 70</td>
    <td>✅</td>
  </tr></tbody>
  <tbody><tr>
    <td width="99999">No scope or type</td>
    <td>✅</td>
  </tr></tbody>
  <tbody><tr>
    <td width="99999">No trailing punctuation</td>
    <td>✅</td>
  </tr></tbody>
  <tbody><tr>
    <td width="99999">No weird characters</td>
    <td>✅</td>
  </tr></tbody>
  <tbody><tr>
    <td width="99999">Start with a capital letter</td>
    <td>✅</td>
  </tr></tbody>
  <tbody><tr>
    <td width="99999">Start with a verb (still very naive)</td>
    <td>✅</td>
  </tr></tbody>
</table>

## LEARNING

### INSTALL GLOBALLY

```shell
git config --global core.hooksPath "$HOME/.githooks"
curl "https://raw.githubusercontent.com/olankens/subduing/HEAD/scripts/subduing.sh" -o "$HOME/.githooks/commit-msg"
chmod +x "$HOME/.githooks/commit-msg"
```

### DELETE GLOBALLY

```shell
git config --global --unset core.hooksPath
rm "$HOME/.githooks/commit-msg"
```

### INSTALL LOCALLY

```shell
curl "https://raw.githubusercontent.com/olankens/subduing/HEAD/scripts/subduing.sh" -o ".git/hooks/commit-msg"
chmod +x ".git/hooks/commit-msg"
```
