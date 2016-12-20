#requires -version 5.0

<#
A demo PowerShell class based module
#>

#dot source helper functions
. .\PSChristmasFunctions.ps1

Enum ListStatus {
    Naughty
    Nice
}

Enum Present {
    Socks
    Barbie
    Elmo
    XBox
    GIJoe
    Underwear
    HotWheels
    EZBakeOven
    Walkman
    PS4
    Pajamas
    Stratego
    GinzuKnives
    ChiaPet
    Tie
    Mittens
    Bicycle
    Pony
    Battleship
    CabbagePatchDoll
}

Class myChristmas {

#class properties
[string]$Greeting
[string]$ElfName
[ListStatus]$List
[int]$DaysRemaining
[string]$CountDown

#class methods
[void]Refresh() {
 Write-Verbose "[CLASS] Invoking Refresh()"
 #calculate christmas for the current year that should be culture aware
 $Christmas = [datetime]::new( (Get-Date).Year,12,25)

 Write-Verbose "[CLASS] Christmas this year is $Christmas"
 $span = $Christmas - (Get-Date)
 $this.DaysRemaining = $span.totalDays
 #strip off milliseconds
 $timestring = $span.ToString()
 $this.CountDown = $timestring.Substring(0,$timestring.LastIndexOf("."))

 Write-Verbose "[CLASS] Getting new greeting"
 $this.Greeting = New-Greeting
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

     if ( (Get-Date).Second%2) {
        $this.List = [ListStatus]::Naughty
     }
     else {
        $this.List = [ListStatus]::Nice
     }
 
     #set the rest of the properties by invoking the defined
     #Refresh() method

     $this.Refresh()
}

}

