param(
    [Parameter(Position=0, Mandatory=$True)]
    [ValidateSet("up", "down", "build", "test", "ip")]
    [string]$Command
)

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
}