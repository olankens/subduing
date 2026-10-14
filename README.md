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
    Validate all Git commit messages by rules for the conventional format, header length, lowercase, verbs, no body, no footer, no scopes, no marks, no weird chars, and text accuracy versus staged changes.
  </div>&nbsp;</td></tr></tbody>
  <tbody><tr><td align="center" width="99999">
    <a href="https://wikipedia.org/wiki/Bash_(Unix_shell)"><img src=".assets/logo-bash.svg" align="center" width="56"></a>
    <picture><img src=".assets/splitter.gif" align="center" height="40" width="1"/></picture>
    <a href="https://git-scm.com"><img src=".assets/logo-git.svg" align="center" width="56"></a>
    <picture><img src=".assets/splitter.gif" align="center" height="40" width="1"/></picture>
    <a href="https://github.com/features/actions"><img src=".assets/logo-githubactions.svg" align="center" width="56"></a>
  </td></tr></tbody>
</table>

## PREVIEWS

<table><tbody><tr><td width="99999">
  <img src=".assets/preview-01.avif" align="center" width="99999">
</td></tr></tbody></table>

## MATRICES

<table>
  <tbody><tr align="center">
    <th><samp>AND</samp></th>
    <th><samp>IOS</samp></th>
    <th><samp>LIN</samp></th>
    <th><samp>MAC</samp></th>
    <th><samp>WIN</samp></th>
    <th><samp>WEB</samp></th>
  </tr></tbody>
  <tbody><tr align="center" height="50">
    <td width="9999">❌</td>
    <td width="9999">❌</td>
    <td width="9999">✅</td>
    <td width="9999">✅</td>
    <td width="9999">✅</td>
    <td width="9999">❌</td>
  </tr></tbody>
</table>

## FEATURES

<table>
  <tbody><tr><td width="99999">Rejects commits where a message fails to accurately describe staged changes by using Claude AI for verifying alignment between commit text and actual code modifications present inside the repository.</td><td>✅</td></tr></tbody>
  <tbody><tr><td>Rejects messages containing body paragraphs below the header to keep repository history concise and focused on single line summaries conveying essential information about each change clearly.</td><td>✅</td></tr></tbody>
  <tbody><tr><td>Rejects messages including footer metadata sections to maintain clean uniform history entries without additional lines cluttering the project changelog and reducing overall readability for everyone.</td><td>✅</td></tr></tbody>
  <tbody><tr><td>Rejects headers shorter than sixty five characters to ensure descriptive subject lines providing sufficient context regarding changes instead of leaving developers guessing at author intent later on.</td><td>✅</td></tr></tbody>
  <tbody><tr><td>Rejects headers exceeding seventy-two characters to prevent wrapped subject lines breaking terminal formatting and making history browsing difficult for team members reviewing past modifications.</td><td>✅</td></tr></tbody>
  <tbody><tr><td>Rejects headers containing empty parenthesis scopes to prevent incomplete conventional notation that implies a scoped change without identifying the component modified during development.</td><td>✅</td></tr></tbody>
  <tbody><tr><td>Rejects headers containing scope notation in parentheses to maintain simple direct subject lines focusing on describing changes rather than specifying affected code components or modules explicitly.</td><td>✅</td></tr></tbody>
  <tbody><tr><td>Rejects headers ending with trailing punctuation like periods, exclamation points, or question marks keeping subject lines clean and consistent across standard commit conventions used today.</td><td>✅</td></tr></tbody>
  <tbody><tr><td>Rejects headers containing weird special characters such as brackets, at signs, hashes, or dollar symbols maintaining clean readable text rendering correctly across version control tools everywhere.</td><td>✅</td></tr></tbody>
  <tbody><tr><td>Rejects headers lacking conventional type prefixes like feat, fix, docs, style, refactor, perf, test, build, ci, chore, or revert ensuring proper categorization and labeling of every change made.</td><td>✅</td></tr></tbody>
  <tbody><tr><td>Rejects headers containing uppercase letters anywhere inside subject lines maintaining consistent lowercase formatting across project history and improving visual uniformity for contributors.</td><td>✅</td></tr></tbody>
  <tbody><tr><td>Rejects headers whose leading word after type prefix is not a valid verb by querying online dictionary services ensuring subjects begin with proper action words describing modifications accurately.</td><td>✅</td></tr></tbody>
</table>

## LEARNING

### INSTALL COMMIT-MSG HOOK

```shell
mkdir -p "$(git rev-parse --git-path hooks)"
curl -fsSL --retry 3 'https://raw.githubusercontent.com/olankens/subduing/HEAD/source/subduing.sh' -o "$(git rev-parse --git-path hooks)/commit-msg"
chmod +x "$(git rev-parse --git-path hooks)/commit-msg"
```

### DELETE COMMIT-MSG HOOK

```shell
rm -f "$(git rev-parse --git-path hooks)/commit-msg"
```

### VERIFY COMMIT WORKFLOW

```yaml
name: 'Verify Commit'
on:
  push:
    branches: [ '**' ]
permissions: { }
concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true
jobs:
  verify:
    if: ${{ ! (endsWith(github.actor, '[bot]') || endsWith(github.event.head_commit.author.name, '[bot]') || endsWith(github.event.head_commit.committer.name, '[bot]') || contains(github.event.head_commit.author.email, '[bot]') || contains(github.event.head_commit.committer.email, '[bot]')) }}
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v7
        with:
          fetch-depth: 1
      - run: |
          curl -fsSL -m 10 --retry 3 'https://raw.githubusercontent.com/olankens/subduing/HEAD/source/subduing.sh' -o "$RUNNER_TEMP/subduing.sh"
      - env:
          MESSAGE: ${{ github.event.head_commit.message }}
        run: |
          printf '%s\n' "$MESSAGE" > "$RUNNER_TEMP/commit-msg"
          sh "$RUNNER_TEMP/subduing.sh" "$RUNNER_TEMP/commit-msg"
```

### VERIFY PULL REQUEST WORKFLOW

```yaml
name: 'Verify Pull Request'
on:
  pull_request:
    types: [ opened, edited, synchronize, reopened ]
permissions:
  contents: read
concurrency:
  group: ${{ github.workflow }}-${{ github.event.pull_request.number }}
  cancel-in-progress: true
jobs:
  heading:
    if: ${{ !endsWith(github.event.pull_request.user.login, '[bot]') }}
    runs-on: ubuntu-latest
    steps:
      - run: |
          curl -fsSL -m 10 --retry 3 'https://raw.githubusercontent.com/olankens/subduing/HEAD/source/subduing.sh' -o "$RUNNER_TEMP/subduing.sh"
      - env:
          HEADING: ${{ github.event.pull_request.title }}
        run: |
          printf '%s\n' "$HEADING" > "$RUNNER_TEMP/commit-msg"
          sh "$RUNNER_TEMP/subduing.sh" "$RUNNER_TEMP/commit-msg"
  commits:
    if: ${{ github.event.action != 'edited' && !endsWith(github.event.pull_request.user.login, '[bot]') }}
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v7
        with:
          fetch-depth: 0
      - run: |
          curl -fsSL -m 10 --retry 3 'https://raw.githubusercontent.com/olankens/subduing/HEAD/source/subduing.sh' -o "$RUNNER_TEMP/subduing.sh"
      - env:
          BASESHA: ${{ github.event.pull_request.base.sha }}
          HEADSHA: ${{ github.event.pull_request.head.sha }}
        run: |
          while IFS= read -r message; do
            printf '%s\n' "$message" > "$RUNNER_TEMP/commit-msg"
            sh "$RUNNER_TEMP/subduing.sh" "$RUNNER_TEMP/commit-msg"
          done < <(git log --format='%s' "$BASESHA..$HEADSHA")
```
