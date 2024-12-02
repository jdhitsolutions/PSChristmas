Function Invoke-Jingle {
    [cmdletbinding()]
    [OutputType('none')]
    [alias('jingle')]

    Param(
        [Parameter(Position = 0, ValueFromPipeline)]
        [PSChristmas]$Christmas = $(New-PSChristmas)
    )

    Begin {
        Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.MyCommand)"
    } #begin

    Process {
        if ($IsWindows -OR $PSEdition -eq 'desktop') {
            Write-Verbose "[PROCESS] Using Christmas object for $($christmas.ElfName)"
            Write-Festive "$($christmas.greeting), $($Christmas.ElfName)"
            $Christmas.Play()
        }
        else {
            Write-Warning 'Invoke-Jingle is only available on Windows systems.'
        }
    } #process

    End {
        Write-Verbose "[END    ] Ending: $($MyInvocation.MyCommand)"
    } #end

}
