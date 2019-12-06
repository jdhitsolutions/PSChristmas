#requires -version 5.0

<#
A demo PowerShell class based module
#>


#dot source helper functions
.  $PSScriptRoot\PSChristmasFunctions.ps1

Export-ModuleMember -Variable xmasData -Alias 'elfme','jingle','wf'