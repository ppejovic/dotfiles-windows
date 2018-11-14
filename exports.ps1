Set-Environment "COMMAND_PROMPT" "$home\cmder.lnk"

Set-Environment "EDITOR" "code.cmd --wait"
Set-Environment "GIT_EDITOR" $env:EDITOR

# Default source code dir
Set-Environment "SOURCE_CODE" "D:\code"

# Disable the Progress Bar
$ProgressPreference='SilentlyContinue'