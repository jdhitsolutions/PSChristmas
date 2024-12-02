Function Get-PSChristmasPresent {
    [cmdletbinding()]
    [OutputType([string])]
    Param(
        [ValidateRange(1, 10)]
        [ValidateScript( {
            if ($_ -gt 10) {
                Throw "Do you want to get on the the naughty list? There is a 10 present limit."
                $false
            }
            else {
                $True
            }
        })]
        [int]$Count = 1
    )

    Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.MyCommand)"
    Write-Verbose "[PROCESS] Getting $count presents"

    $presents = $global:xmasData.Presents | Get-Random -count $Count

    $presents

    Write-Verbose "[END    ] Ending: $($MyInvocation.MyCommand)"

}
