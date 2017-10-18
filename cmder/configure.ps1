$lnk = Join-Path $home "cmder.lnk"

if ((which cmder) -and !(Test-Path $lnk))    {
    $cmderRoot = Split-Path (which cmder)

    $conEmuFolder = Join-Path $cmderRoot "vendor\conemu-maximus5"
    $icon   = Join-Path $cmderRoot "\icons\cmder.ico"
    $config = Join-Path $PSScriptRoot "ConEmu.xml"

    $objShell = New-Object -ComObject ("WScript.Shell")
    $shortcut = $objShell.CreateShortcut($lnk)
    $shortcut.TargetPath = which cmd
    $shortcut.Arguments = "/c ""SET CMDER_ROOT=$cmderRoot&& START /D """"$conEmuFolder"""" ConEmu.exe /Icon $icon /Title Cmder /LoadCfgFile $config"""
    $shortcut.IconLocation = $icon
    $shortcut.WindowStyle = 7
    $shortcut.Save()

    Invoke-Item $shortcut.FullName
}

