#Requires -version 5.0

<#
Helper functions for the PSChristmas class-based module

#>

#import data from json
$xmasData = Get-Content .\data.json | ConvertFrom-Json

Function PlayTune {
[cmdletbinding()]
Param()

Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.Mycommand)"

<#
The first number is the reciprocal of the duration and the rest is the 
note and octave (which we use for getting the frequency).  
For example, 4A4 is a quarter A note
#>

#first verse only
$notes =  write 4A4 4A4 2A4        4A4 4A4 2A4        4A4 4C4 4F3 8G3             1A4 `
  4Bb4 4Bb4 4Bb4 8Bb4     4Bb4 4A4 4A4 8A4 8A4    4A4 4G3 4G3 4A4    2G3 2C4 `
  4A4 4A4 2A4       4A4 4A4 2A4    4A4 4C4 4F3 4G3     1A4        4Bb4 4Bb4 4Bb4 4Bb4 `
  4Bb4 4A4 4A4 8A4 8A4    4C4 4C4 4Bb4 4G3     1F3  

function Play([int] $freq, [int] $duration) {
  [console]::Beep($freq, $duration)
}

function GetNoteFreq([string]$note) {
  # n is the number of half steps from the fixed note.
  $note -match '([A-G#]{1,2})(\d+)' | out-null
  $octave = ([int] $matches[2]) - 4
  $n = $octave * 12 + ( GetHalfStepsFromA $matches[1] )
  $freq = $f0 * [math]::Pow($a, $n)

  return $freq
}
 
function GetHalfStepsFromA([string] $note) {
  switch($note)
  {
    'A'  { 0 }
    'A#' { 1 }
    'Bb' { 1 }
    'B'  { 2 }
    'C'  { 3 }
    'C#' { 4 }
    'Db' { 4 }
    'D'  { 5 }
    'D#' { 6 }
    'Eb' { 6 }
    'E'  { 7 }
    'F'  { 8 }
    'F#' { 9 }
    'Gb' { 9 }
    'G'  { 10 }
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
$a = [math]::pow(2,(1/12)) # Twelth root of 2


$StandardDuration = 1000 
foreach($note in $notes)  {

  $note -match '(\d)(.+)' | out-null
  $duration = $StandardDuration / ([int] $matches[1])
  $playNote = $matches[2]
  $freq = GetNoteFreq $playNote

 Play $freq $duration
  start-sleep -milli 50
}

Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"

}

Function ShowGraphic {
[cmdletbinding()]
Param()



Clear-Host

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

$selected = ($msg1,$msg2,$msg3,$msg4,$msg5,$msg6 | Get-Random)
If([bool]!($i%2)) {
	Write-Host -ForegroundColor Green -Object $selected
        
	} else {
	Write-Host -ForegroundColor Red -Object $selected
	}

Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"

}

Function New-ElfName {
[cmdletbinding()]
Param()

Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.Mycommand)"

$name = "{0} {1}{2}" -f (Get-Random $xmasData.FirstNames),(Get-Random $xmasData.Modifiers),(Get-Random $xmasData.LastNames)
Write-Verbose "[PROCESS] Created name $name"
#return the result
$name

Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"

}

Function New-Greeting {
[cmdletbinding()]
Param()

Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.Mycommand)"

$xmasData.Greeting | Get-Random

Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"
}

Function Get-Present {
[cmdletbinding()]
Param(
[ValidateScript({$_ -GE 1})]
[int]$Count = 1
)

Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.Mycommand)"
Write-Verbose "[PROCESS] Getting $count presents"

$presents = $xmasData.presents | Get-Random -count $Count

$presents

Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"

}

Function New-MyChristmas {
[cmdletbinding()]
Param()

Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.Mycommand)"

New-Object -TypeName myChristmas

Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"
}

Function Invoke-Jingle {
[cmdletbinding()]
Param(
[Parameter(Position = 0, Mandatory, ValueFromPipeline)]
[myChristmas]$Christmas)

Begin {
    Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.Mycommand)"  
} #begin

Process {
    $Christmas.Play()
} #process

End {
    Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"
} #end

}

Function Show-Message {
[cmdletbinding()]
Param(
[Parameter(Position = 0, Mandatory, ValueFromPipeline)]
[myChristmas]$Christmas)

Begin {
    Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.Mycommand)"  
} #begin

Process {
    $Christmas.Show()
} #process

End {
    Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"
} #end

}
