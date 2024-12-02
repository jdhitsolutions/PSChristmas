Function New-PSChristmas {
    [cmdletbinding()]
    [OutputType("PSChristmas")]
    Param()

    Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.MyCommand)"

    #New-Object -TypeName PSChristmas
    [PSChristmas]::New()

    Write-Verbose "[END    ] Ending: $($MyInvocation.MyCommand)"
}
