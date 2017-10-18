# Clone AutoHotKey repo along side this repo
Push-Location "$(git rev-parse --show-toplevel)\.."

$lnk = Join-Path $env:APPDATA "Microsoft\Windows\Start Menu\Programs\Startup\master.ahk.lnk"

if (!(Test-Path $lnk))    {
    git clone https://github.com/ppejovic/autohotkey.git; cd .\autohotkey
    $objShell = New-Object -ComObject ("WScript.Shell")
    $objShortCut = $objShell.CreateShortcut($lnk)
    $objShortCut.TargetPath = (Get-ChildItem .\master.ahk).FullName
    $objShortCut.Save()

    Invoke-Item $objShortCut.FullName
}

Pop-Location