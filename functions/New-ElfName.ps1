Function New-ElfName {
    [cmdletbinding()]
    [OutputType([string])]
    [alias("elfme")]

    Param (
        [Parameter(HelpMessage = "Specify the number of names to generate up to 50.")]
        [ValidateRange(1, 50)]
        [int]$Count = 1
    )

    Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.MyCommand)"
    Write-Verbose "[BEGIN  ] Creating $count name(s)"
    #insert a sleep if generating more than one name to increase randomization
    if ($count -gt 1) {
        #milliseconds
        $sleep = 250
    }
    else {
        $sleep = 0
    }
    Try {
        [void](Get-Variable -Name xmasData -Scope global -ErrorAction Stop)

        1..$Count | ForEach-Object {
            $name = "{0} {1}{2}" -f (Get-Random $global:xmasData.FirstNames), (Get-Random $global:xmasData.Modifiers), (Get-Random $global:xmasData.LastNames)
            Start-Sleep -Milliseconds $sleep
            Write-Verbose "[PROCESS] Created name $name"
            #return the result
            $name
        }
    }
    Catch {
        Write-Warning "Failed to find the `xmasdata` variable from the PSChristmas module. $($_.exception.message)"
    }

    Write-Verbose "[END    ] Ending: $($MyInvocation.MyCommand)"

}
