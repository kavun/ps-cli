<#
.SYNOPSIS
This script is an example of how any .ps1 script can provide content to `Get-Help`.

.DESCRIPTION
USAGE
    .\3-help.ps1 <command>

COMMANDS
    up          run `docker-compose up`
    down        run `docker-compose down`
    build       run `dotnet build`
    test        run `dotnet test`
    ip          get your local ip
    help, -?    show this help message

.LINK
    https://kevinareed.com/2021/04/14/creating-a-command-based-cli-in-powershell/
#>
param(
    [Parameter(Position=0)]
    [ValidateSet("up", "down", "build", "test", "ip", "help")]
    # The command to run
    [string]$Command
)

function Command-Help { Get-Help $PSCommandPath }

if (!$Command) {
    Command-Help
    exit
}

function Command-Up    { iex "docker compose up" }
function Command-Down  { iex "docker compose down" }
function Command-Build { iex "dotnet build" }
function Command-Test  { iex "dotnet test" }
function Command-Ip {
    $ip = iwr "https://api.ip.sb/ip" `
        | Select-Object -Expand Content
    
    Write-Host "Your IP address is: " -N
    Write-Host $ip -F Green
}

switch ($Command) {
    "up"    { Command-Up }
    "down"  { Command-Down }
    "build" { Command-Build }
    "test"  { Command-Test }
    "ip"    { Command-Ip }
    "help"  { Command-Help }
}