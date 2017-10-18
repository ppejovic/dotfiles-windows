Set-Environment "COMMAND_PROMPT" "$env:HOME\cmder.lnk"

Set-Environment "VSCODE" "code.cmd --wait"
Set-Environment "EDITOR" "$env:VSCODE"
Set-Environment "GIT_EDITOR" $env:EDITOR

# Default source code dir
Set-Environment "SOURCE_CODE" "$env:HOME\Code"

# Disable the Progress Bar
$ProgressPreference='SilentlyContinue'