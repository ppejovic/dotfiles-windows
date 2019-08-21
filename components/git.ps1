if (((Get-Command git -ErrorAction SilentlyContinue) -ne $null) -and ((Get-Module -ListAvailable Posh-Git -ErrorAction SilentlyContinue) -ne $null)) {
  Import-Module Posh-Git

  function Set-LocationToGitRoot {
    $root = (git rev-parse --show-toplevel)
    
    if($null -ne $root) {
      Set-Location $root
    }
  }
  
  Set-Alias -name cdr -Value Set-LocationToGitRoot
}
