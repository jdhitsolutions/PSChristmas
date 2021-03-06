

#import data from json
$xmasData = Get-Content $PSScriptRoot\data.json | ConvertFrom-Json

#region Private helper functions for the PSChristmas class-based module
Function PlayTune {
    [cmdletbinding()]
    [outputtype("none")]
    Param()

    Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.Mycommand)"

    <#
The first number is the reciprocal of the duration and the rest is the
note and octave (which we use for getting the frequency).
For example, 4A4 is a quarter A note
#>

    #first verse only
    $notes = Write-Output 4A4 4A4 2A4        4A4 4A4 2A4        4A4 4C4 4F3 8G3             1A4 `
        4Bb4 4Bb4 4Bb4 8Bb4     4Bb4 4A4 4A4 8A4 8A4    4A4 4G3 4G3 4A4    2G3 2C4 `
        4A4 4A4 2A4       4A4 4A4 2A4    4A4 4C4 4F3 4G3     1A4        4Bb4 4Bb4 4Bb4 4Bb4 `
        4Bb4 4A4 4A4 8A4 8A4    4C4 4C4 4Bb4 4G3     1F3

    function Play([int] $freq, [int] $duration) {
        [console]::Beep($freq, $duration)
    }

    function GetNoteFreq([string]$note) {
        # n is the number of half steps from the fixed note.
        $note -match '([A-G#]{1,2})(\d+)' | Out-Null
        $octave = ([int] $matches[2]) - 4
        $n = $octave * 12 + ( GetHalfStepsFromA $matches[1] )
        $freq = $f0 * [math]::Pow($a, $n)

        return $freq
    }

    function GetHalfStepsFromA([string] $note) {
        switch ($note) {
            'A' { 0 }
            'A#' { 1 }
            'Bb' { 1 }
            'B' { 2 }
            'C' { 3 }
            'C#' { 4 }
            'Db' { 4 }
            'D' { 5 }
            'D#' { 6 }
            'Eb' { 6 }
            'E' { 7 }
            'F' { 8 }
            'F#' { 9 }
            'Gb' { 9 }
            'G' { 10 }
            'G#' { 11 }
            'Ab' { 11 }
        }
    }


    #
    # Note is given by fn=f0 * (a)^n
    # a is the twelth root of 2
    # n is the number of half steps from f0, positive or negative.
    # f0 used here is A4 at 440 Hz
    #
    $f0 = 440;
    $a = [math]::pow(2, (1 / 12)) # Twelth root of 2


    $StandardDuration = 1000
    foreach ($note in $notes) {

        $note -match '(\d)(.+)' | Out-Null
        $duration = $StandardDuration / ([int] $matches[1])
        $playNote = $matches[2]
        $freq = GetNoteFreq $playNote

        Play $freq $duration
        Start-Sleep -milli 50
    }

    Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"

}

Function ShowGraphic {
    [cmdletbinding()]
    [outputtype("none")]
    Param()

    # Clear-Host

    Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.Mycommand)"

    $Msg1 =
    @"
.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:.
.     *                                       .
.    /.\        Merry Christmas               .
.   /..'\            from all of us           .
.   /'.'\                in PowerShell        .
.  /.''.'\                                    .
.  /.'.'.\                                    .
. /'.''.'.\                                   .
. ^^^[_]^^^                                   .
.                                             .
.                                             .
.                                          .
.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:.
"@


    $Msg2 =
    @"
                    _...
              o_.-"`    `\
       .--.  _ `'-._.-'""-;     _
     .'    \`_\_  {_.-a"a-}  _ / \
   _/     .-'  '. {c-._o_.){\|`  |
  (@`-._ /       \{    ^  } \\ _/
   `~\  '-._      /'.     }  \}  .-.
     |>:<   '-.__/   '._,} \_/  / ())
     |     >:<   `'---. ____'-.|(`"`
     \            >:<  \\_\\_\ | ;
      \                 \\-{}-\/  \
       \                 '._\\'   /)
        '.                       /(
          `-._ _____ _ _____ __.'\ \
            / \     / \     / \   \ \
         _.'/^\'._.'/^\'._.'/^\'.__) \
     ,=='  `---`   '---'   '---'      )
     `"""""""""""""""""""""""""""""""`
"@

    $msg3 =
    @"
               ___
             /`   `'.
            /   _..---;
            |  /__..._/  .--.-.
            |.'  e e | ___\_|/____
           (_)'--.o.--|    | |    |
          .-( `-' = `-|____| |____|
         /  (         |____   ____|
         |   (        |_   | |  __|
         |    '-.--';/'/__ | | (  `|
         |      '.   \    )"";--`\ /
         \        ;   |--'    `;.-'
         |`-.__ ..-'--'`;..--'`
"@

    $msg4 =
    @"
           *             ,
                       _/^\_
                      <     >
     *                 /.-.\         *
              *        `/&\`                   *
                      ,@.*;@,
                     /_o.I %_\    *
        *           (`'--:o(_@;
                   /`;--.,__ `')             *
                  ;@`o % O,*`'`&\
            *    (`'--)_@ ;o %'()\      *
                 /`;--._`''--._O'@;
                /&*,()~o`;-.,_ `""`)
     *          /`,@ ;+& () o*`;-';\
               (`""--.,_0 +% @' &()\
               /-.,_    ``''--....-'`)  *
          *    /@%;o`:;'--,.__   __.'\
              ;*,&(); @ % &^;~`"`o;@();         *
              /(); o^~; & ().o@*&`;&%O\
              `"="==""==,,,.,="=="==="`
           __.----.(\-''#####---...___...-----._
         '`         \)_`"""""`
                 .--' ')
               o(  )_-\
                 `"""` `

"@

    $msg5 =
    @"
                        .--------.
   *               .    |________|        .          *
                        |      __|/\
             *        .-'======\_\o/.
                     /___________<>__\
               ||||||  /  (o) (o)  \
               |||||| |   _  O  _   |          .
     .         |||||| |  (_)   (_)  |
               ||||||  \   '---'   /    *
               \====/   [~~~~~~~~~]
                \\//  _/~||~`|~~~~~\_
                _||-'`/  ||  |      \`'-._       *
        *    .-` )|  ;   ||  |)      ;    '.
            /    `--.|   ||  |       |      `\
           |         \   |||||)      |-,      \         .
            \       .;       _       ; |_,    |
             `'''||` ,\     (_)     /,    `.__/
                 ||.`  '.         .'  `.             *
      *          ||       ` ' ' `       \
                 ||                      ;
   .          *  ||                      |    .
                 ||                      |              *
                 ||                      |
 .__.-""-.__.-"""||                      ;.-"""-.__.-""-.__.
                 ||                     /
                 ||'.                 .'
                 ||  '-._  _ _  _ _.-'
                `""`
"@
    $msg6 =
    @"
                                  _
                               .-(_)
                              / _/
                           .-'   \
                          /       '.
                        ,-~--~-~-~-~-,
                       {__.._...__..._}             ,888,
       ,888,          /\##"  6  6  "##/\          ,88' `88,
     ,88' '88,__     |(\`    (__)    `/)|     __,88'     `88
    ,88'   .8(_ \_____\_    '----'    _/_____/ _)8.       8'
    88    (___)\ \      '-.__    __.-'      / /(___)
    88    (___)88 |          '--'          | 88(___)
    8'      (__)88,___/                \___,88(__)
              __`88,_/__________________\_,88`__
             /    `88,       |88|       ,88'    \
            /        `88,    |88|    ,88'        \
           /____________`88,_\88/_,88`____________\
          /88888888888888888;8888;88888888888888888\
         /^^^^^^^^^^^^^^^^^^`/88\\^^^^^^^^^^^^^^^^^^\
        /                    |88| \============,     \
       /_  __  __  __   _ __ |88|_|^  MERRY    | _ ___\
       |;:.                  |88| | CHRISTMAS! |      |
       |;;:.                 |88| '============'      |
       |;;:.                 |88|                     |
       |::.                  |88|                     |
       |;;:'                 |88|                     |
       |:;,                  |88|                     |
       '---------------------""""---------------------'
"@

    $i = Get-Random -Minimum 1 -Maximum 6

    $selected = ($msg1, $msg2, $msg3, $msg4, $msg5, $msg6 | Get-Random)
    If ([bool]!($i % 2)) {
        Write-Host -ForegroundColor Green -Object $selected

    }
    else {
        Write-Host -ForegroundColor Red -Object $selected
    }

    Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"

}

#endregion

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
        $this.Greeting = New-PSChristmasGreeting
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
    PSChristmas() {
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
#endregion

#region Public functions

# it appears that this function needs to be in the same file as the
# class definition so that the typename can be discovered.
Function New-PSChristmas {
    [cmdletbinding()]
    [OutputType("PSChristmas")]
    Param()

    Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.Mycommand)"

    #New-Object -TypeName PSChristmas
    [PSChristmas]::New()

    Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"
}
Function New-ElfName {
    [cmdletbinding()]
    [outputtype([string])]
    [alias("elfme")]

    Param (
        [Parameter(HelpMessage = "Specify the number of names to generate up to 50.")]
        [ValidateRange(1, 50)]
        [int]$Count = 1
    )

    Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.Mycommand)"
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

    Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"

}

Function New-PSChristmasGreeting {
    [cmdletbinding()]
    [OutputType([string])]
    Param()

    Begin {
        Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.Mycommand)"
    }
    Process {
        Try {
            [void](Get-Variable xmasData -ErrorAction Stop)
            $global:xmasData.Greeting | Get-Random -count 1
        }
        Catch {
            Write-Warning "Failed to find the `xmasdata` variable from the PSChristmas module."
        }
    }
    End {
        Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"
    }
}

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

    Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.Mycommand)"
    Write-Verbose "[PROCESS] Getting $count presents"

    $presents = $global:xmasData.Presents | Get-Random -count $Count

    $presents

    Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"

}

Function Invoke-Jingle {
    [cmdletbinding()]
    [OutputType("none")]
    [alias("jingle")]

    Param(
        [Parameter(Position = 0, ValueFromPipeline)]
        [PSChristmas]$Christmas = $(New-PSChristmas)
    )

    Begin {
        Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.Mycommand)"
    } #begin

    Process {
        Write-Verbose "[PROCESS] Using Christmas object for $($christmas.elfname)"
        Write-Festive "$($christmas.greeting), $($Christmas.elfname)"
        $Christmas.Play()
    } #process

    End {
        Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"
    } #end

}

Function Show-PSChristmasMessage {
    [cmdletbinding()]
    [OutputType("none")]
    Param(
        [Parameter(Position = 0, ValueFromPipeline)]
        [PSChristmas]$Christmas = $(New-PSChristmas)
    )

    Begin {
        Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.Mycommand)"
    } #begin

    Process {
        Write-Verbose "[PROCESS] Using Christmas object for $($christmas.elfname)"
        $Christmas.Show()

        $msg = "`n`t{0}, {1}" -f $Christmas.Greeting, $Christmas.ElfName
        Write-Festive $msg
    } #process

    End {
        Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"
    } #end

}


Function Write-Festive {
    [cmdletbinding()]
    [OutputType("None")]
    [alias("wf")]

    Param(
        [Parameter(Position = 0, Mandatory, HelpMessage = "Enter a text message", ValueFromPipeline)]
        [ValidateNotNullorEmpty()]
        [string]$Text
    )

    Begin {
        Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.Mycommand)"
        $colors = ([enum]::GetNames([System.ConsoleColor])).Where( { $_ -ne $host.ui.RawUI.BackgroundColor })
    } #begin

    Process {

        $Text.ToCharArray() | ForEach-Object -begin {
            #define a hashtable of parameters to splat to Write-Host
            $paramHash = @{NoNewLine = $True; }
        } -process {
            #use a color if not a space
            if ($_ -notmatch "\s") {
                $paramhash.ForegroundColor = (Get-Random -inputobject $colors -count 1)
                $paramhash.BackgroundColor = do {
                    #get a background color that is different than the
                    #foregroundcolor
                    Get-Random -InputObject $colors -Count 1
                } until($_ -ne $paramhash.ForegroundColor)
            } #if not whitespace
            else {
                #clear colors
                $paramhash.Remove("ForegroundColor")
                $paramhash.Remove("BackgroundColor")
            }
            #write each character to the host
            $_ | Write-Host @paramhash

        } -end { "`n" }

    } #Process

    End {
        Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"
    }
}
#endregion