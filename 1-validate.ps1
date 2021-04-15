param(
    [Parameter(Position=0, Mandatory=$True)]
    [ValidateSet("up", "down", "build", "test", "migrate", "ip")]
    [string]$Command
)

Write-Host $Command