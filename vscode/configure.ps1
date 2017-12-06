# TODO Review - symlinking, copying or alternative

Push-Location $PSScriptRoot

if(which code){
    $userDir = Join-Path $Env:APPDATA "Code\User"
    $snippetsDir = Join-Path $userDir "snippets"

    if (!(Test-Path $userDir)) {New-Item $userDir -Type Directory | Out-Null}
    if (!(Test-Path $snippetsDir)) {New-Item $snippetsDir -Type Directory | Out-Null}

    Get-ChildItem ./*.json | ForEach-Object { 
        $target = Join-Path $userDir $_.Name
        if(Test-Path $target) { Remove-Item $target }
        cmd /c mklink $target $_
    }

    Get-ChildItem ./snippets/** | ForEach-Object { 
        $target = Join-Path $snippetsDir $_.Name
        if(Test-Path $target) { Remove-Item $target }
        cmd /c mklink $target $_
    }
}

Pop-Location