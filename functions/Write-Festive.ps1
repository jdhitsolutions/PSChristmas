Function Write-Festive {
    [cmdletbinding()]
    [OutputType("None")]
    [alias("wf")]

    Param(
        [Parameter(Position = 0, Mandatory, HelpMessage = "Enter a text message", ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string]$Text
    )

    Begin {
        Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.MyCommand)"
        $colors = ([enum]::GetNames([System.ConsoleColor])).Where( { $_ -ne $host.ui.RawUI.BackgroundColor })
    } #begin

    Process {

        $Text.ToCharArray() | ForEach-Object -begin {
            #define a hashtable of parameters to splat to Write-Host
            $ParamHash = @{NoNewLine = $True; }
        } -process {
            #use a color if not a space
            if ($_ -notmatch "\s") {
                $ParamHash.ForegroundColor = (Get-Random -InputObject $colors -count 1)
                $ParamHash.BackgroundColor = do {
                    #get a background color that is different than the
                    #ForeGroundColor
                    Get-Random -InputObject $colors -Count 1
                } until($_ -ne $ParamHash.ForegroundColor)
            } #if not whitespace
            else {
                #clear colors
                $ParamHash.Remove("ForegroundColor")
                $ParamHash.Remove("BackgroundColor")
            }
            #write each character to the host
            $_ | Write-Host @ParamHash

        } -end { "`n" }

    } #Process

    End {
        Write-Verbose "[END    ] Ending: $($MyInvocation.MyCommand)"
    }
}
