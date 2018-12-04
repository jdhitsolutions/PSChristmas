#requires -version 5.0

<#
A demo PowerShell class based module
#>

Enum ListStatus {
    Naughty
    Nice
}

Class myChristmas {
    
    #class properties
    [string]$Greeting
    [string]$ElfName
    [ListStatus]$List
    [string]$ChristmasDay
    [int32]$DaysRemaining
    [string]$CountDown
    
    #class methods
    [void]Refresh() {
        Write-Verbose "[CLASS] Invoking Refresh()"
        #calculate christmas for the current year that should be culture aware
        $Christmas = [datetime]::new( (Get-Date).Year, 12, 25)
 
        Write-Verbose "[CLASS] Christmas this year is $Christmas"
        $this.ChristmasDay = $Christmas.DayOfWeek
        $span = $Christmas - (Get-Date)
        $this.DaysRemaining = $span.totalDays
        #strip off milliseconds
        $timestring = $span.ToString()
        $this.CountDown = $timestring.Substring(0, $timestring.LastIndexOf("."))

        Write-Verbose "[CLASS] Getting new greeting"
        $this.Greeting = New-myChristmasGreeting
    }

    [void]Play() {
        Write-Verbose "[CLASS] Invoking Play()"
        PlayTune
    }

    [void]Show() {
        Write-Verbose "[CLASS] Invoking Show()"
        ShowGraphic
    }

    #class constructor
    myChristmas() {
        Write-Verbose "[CLASS] Invoking Constructor"
        $this.ElfName = New-ElfName
    
        if ( (Get-Date).Second % 2) {
            $this.List = [ListStatus]::Naughty
        }
        else {
            $this.List = [ListStatus]::Nice
        }
    
        #set the rest of the properties by invoking the defined
        #Refresh() method
    
        $this.Refresh()
    }

} #close class definition

# it appears that this function needs to be in the same file as the
# class definition so that the typename can be discovered.
Function New-MyChristmas {
    [cmdletbinding()]
    [OutputType([myChristmas])]
    Param()
    
    Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.Mycommand)"
    
    #New-Object -TypeName myChristmas
    [myChristmas]::New()
    
    Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"
}

#dot source helper functions
.  $PSScriptRoot\PSChristmasFunctions.ps1

Export-ModuleMember -Variable xmasData