$installProgramming = Read-Host -Prompt "Install programming packages? (y/n)"
$installHam = Read-Host -Prompt "Install ham radio packages? (y/n)"
$installGames = Read-Host -Prompt "Install gaming packages? (y/n)"

# Core packages, I always want these installed
winget install -e --id Microsoft.PowerShell
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Microsoft.WindowsTerminal
winget install -e --id Git.Git
winget install -e --id Google.Chrome
winget install -e --id Mikrotik.Winbox
# install source code pro font

if ($installProgramming -eq "y") {
    winget install -e --id CoreyButler.NVMforWindows
    winget install -e --id GoLang.Go
    winget install -e --id JetBrains.Toolbox

    nvm install lts
    nvm use lts
}

if ($installHam -eq "y") {
    winget install -e --id HamRadioDeluxe.HamRadioDeluxe
    winget install -e --id K1JT.wsjtx
}

if ($installGames -eq "y") {
    winget install -i --id GOG.Galaxy
    winget install -i --id Valve.Steam
}
