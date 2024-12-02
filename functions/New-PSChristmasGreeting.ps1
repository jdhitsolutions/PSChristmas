Function New-PSChristmasGreeting {
    [cmdletbinding()]
    [OutputType([string])]
    Param()

    Begin {
        Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.MyCommand)"
    }
    Process {
        Try {
            [void](Get-Variable xmasData -ErrorAction Stop)
            $global:xmasData.Greeting | Get-Random -count 1
        }
        Catch {
            Write-Warning "Failed to find the `xmasData` variable from the PSChristmas module."
        }
    }
    End {
        Write-Verbose "[END    ] Ending: $($MyInvocation.MyCommand)"
    }
}
