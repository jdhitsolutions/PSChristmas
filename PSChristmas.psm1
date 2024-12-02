<#
A demo PowerShell class-based module
#>

#dot source helper functions
Get-ChildItem -Path $PSScriptRoot\functions\*.ps1 | ForEach-Object {
    . $_.FullName
}

#region Class

Enum ListStatus {
    Naughty
    Nice
}

Class PSChristmas {
    #class properties
    [string]$Greeting
    [string]$ElfName
    [ListStatus]$List
    [string]$ChristmasDay
    [int32]$DaysRemaining
    [string]$CountDown

    #class methods
    [void]Refresh() {
        Write-Verbose '[CLASS] Invoking Refresh()'
        #calculate christmas for the current year that should be culture aware
        $Christmas = [datetime]::new( (Get-Date).Year, 12, 25)

        Write-Verbose "[CLASS] Christmas this year is $Christmas"
        $this.ChristmasDay = $Christmas.DayOfWeek
        $span = $Christmas - (Get-Date)
        $this.DaysRemaining = $span.totalDays
        #strip off milliseconds
        $TimeString = $span.ToString()
        $this.CountDown = $TimeString.Substring(0, $TimeString.LastIndexOf('.'))

        Write-Verbose '[CLASS] Getting new greeting'
        $this.Greeting = New-PSChristmasGreeting
    }

    [void]Play() {
        Write-Verbose '[CLASS] Invoking Play()'
        PlayTune
    }

    [void]Show() {
        Write-Verbose '[CLASS] Invoking Show()'
        ShowGraphic
    }

    #class constructor
    PSChristmas() {
        Write-Verbose '[CLASS] Invoking Constructor'
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
#endregion

#import data from json
$xmasData = Get-Content $PSScriptRoot\data.json | ConvertFrom-Json
Export-ModuleMember -Variable xmasData -Alias 'elfme', 'jingle', 'wf'
