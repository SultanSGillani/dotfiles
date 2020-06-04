Remove-Alias -Name gl -Force
Remove-Alias -Name gp -Force

$message = $args[0]

function git-pull { git pull }
function git-push { git push }
function cd-to { z -JumpPath $args[0]}
function git-commit-message { git commit -m Write-Output $message}

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}

Import-Module posh-git
Import-Module z
Set-Alias -Name gl -Value git-pull
Set-Alias -Name gp -Value git-push
Set-Alias -Name gcmsg -Value git-commit-message
Set-Alias -Name cd -Value cd-to -Option AllScope