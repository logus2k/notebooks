# Windows 10 Powershell profile location:
# C:\Users\[username]\Documents\PowerShell\Microsoft.PowerShell_profile.ps1

# Powershell WSL Interop:
# https://github.com/mikebattista/PowerShell-WSL-Interop 

# Colors in terminal - Escape sequences
# http://jafrog.com/2013/11/23/colors-in-terminal.html

# ANSI Escape Code Graphics:
# https://en.wikipedia.org/wiki/ANSI_escape_code#graphics

# Powershell Terminal
Set-PSReadlineOption -Colors @{Command = "#E5BD00"}
Set-PSReadlineOption -Colors @{Default = "#E9D496"}
Set-PSReadlineOption -Colors @{Parameter = "#3CB371"}
Set-PSReadlineOption -Colors @{Member = "#6495ED"}

Set-PSReadlineOption -Colors @{Keyword = "#3CB371"}
Set-PSReadlineOption -Colors @{Variable = "#3CB371"}
Set-PSReadlineOption -Colors @{Comment = "#3CB371"}

Set-PSReadlineOption -Colors @{Error = "#CD5C5C"}

# GitPromptSettings
$GitPromptSettings.DefaultPromptPath.ForegroundColor = "#ED9121"
$GitPromptSettings.DefaultPromptSuffix.ForegroundColor = "#ED9121"
$GitPromptSettings.BranchColor.ForegroundColor = "#6495ED"
$GitPromptSettings.BranchAheadStatusSymbol.ForegroundColor = "#3CB371"

$GitPromptSettings.ErrorColor.ForegroundColor = "#CD5C5C"
$GitPromptSettings.StashColor.ForegroundColor = "#CD5C5C"
$GitPromptSettings.BranchBehindStatusSymbol.ForegroundColor = "#CD5C5C"
$GitPromptSettings.LocalWorkingStatusSymbol.ForegroundColor = "#CD5C5C"
$GitPromptSettings.AfterStash.ForegroundColor = "#CD5C5C"
$GitPromptSettings.BeforeStash.ForegroundColor = "#CD5C5C"
$GitPromptSettings.WorkingColor.ForegroundColor = "#CD5C5C"
$GitPromptSettings.IndexColor.ForegroundColor = "#3CB371"

# Import WSL Commands
Import-WslCommand "apt", "awk", "emacs", "grep", "head", "less", "ls", "man", "sed", "seq", "ssh", "sudo", "tail", "vim", "fortune", "cowsay", "top", "nano", "tmux", "wget"

# Write-Host "▄▄▌ ▐ ▄▌▄▄▄ .▄▄▌   ▄▄·       • ▌ ▄ ·. ▄▄▄ .▄▄ " -ForegroundColor "DarkYellow"
# Write-Host "██· █▌▐█▀▄.▀·██•  ▐█ ▌▪▪     ·██ ▐███▪▀▄.▀·██▌" -ForegroundColor "DarkYellow"
# Write-Host "██▪▐█▐▐▌▐▀▀▪▄██▪  ██ ▄▄ ▄█▀▄ ▐█ ▌▐▌▐█·▐▀▀▪▄▐█·" -ForegroundColor "DarkYellow"
# Write-Host "▐█▌██▐█▌▐█▄▄▌▐█▌▐▌▐███▌▐█▌.▐▌██ ██▌▐█▌▐█▄▄▌.▀ " -ForegroundColor "DarkYellow"
# Write-Host " ▀▀▀▀ ▀▪ ▀▀▀ .▀▀▀ ·▀▀▀  ▀█▄▀▪▀▀  █▪▀▀▀ ▀▀▀  ▀ " -ForegroundColor "DarkYellow"

fortune | cowsay

Write-Host

Write-Host "Powershell" $PSVersionTable.PSEdition "version" $PSVersionTable.PSVersion -ForegroundColor "Blue"

Write-Host
