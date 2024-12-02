Function Show-PSChristmasMessage {
    [cmdletbinding()]
    [OutputType("none")]
    Param(
        [Parameter(Position = 0, ValueFromPipeline)]
        [PSChristmas]$Christmas = $(New-PSChristmas)
    )

    Begin {
        Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.MyCommand)"
    } #begin

    Process {
        Write-Verbose "[PROCESS] Using Christmas object for $($christmas.ElfName)"
        $Christmas.Show()

        $msg = "`n`t{0}, {1}" -f $Christmas.Greeting, $Christmas.ElfName
        Write-Festive $msg
    } #process

    End {
        Write-Verbose "[END    ] Ending: $($MyInvocation.MyCommand)"
    } #end

}
