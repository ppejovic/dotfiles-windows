if ($null -ne (Get-Command git -ErrorAction SilentlyContinue)) {

  if($null -ne (Get-Module -ListAvailable Posh-Git -ErrorAction SilentlyContinue)) {
    Import-Module Posh-Git
    Start-SshAgent -Quiet
  }

  function Set-LocationToGitRoot ([string] $solutionFile) {
    $root = (git rev-parse --show-toplevel)
    
    if($null -ne $root) {
      Set-Location $root
    }
  }
  
  Set-Alias -name cdr -Value Set-LocationToGitRoot

}
