---
external help file: PSChristmas-help.xml
Module Name: PSChristmas
online version:
schema: 2.0.0
---

# Show-PSChristmasMessage

## SYNOPSIS

Display a hidden message in a Christmas object

## SYNTAX

```yaml
Show-PSChristmasMessage [[-Christmas] <PSChristmas>] [<CommonParameters>]
```

## DESCRIPTION

Display a holiday themed message to the console. This function does not write anything to the pipeline.

## EXAMPLES

### Example 1

```powershell
PS C:\> Show-PSChristmasMessage

              ___
             /   '.
            /   _..---;
            |  /__..._/  .--.-.
            |.'  e e | ___\_|/____
           (_)'--.o.--|    | |    |
          .-( -' = -|____| |____|
         /  (         |____   ____|
         |   (        |_   | |  __|
         |    '-.--';/'/__ | | (  |
         |      '.   \    )"";--\ /
         \        ;   |--'    ;.-'
         |-.__ ..-'--';..--'

        Merry Xmas, Starlight Dustypants
```

The actual output is written to the console in color. You can also pipe a PSChristmas object to this command.

## PARAMETERS

### -Christmas

An object created with New-PSChristmas

```yaml
Type: PSChristmas
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### PSChristmas

## OUTPUTS

### none

## NOTES

Learn more about PowerShell: http://jdhitsolutions.com/blog/essential-powershell-resources/

## RELATED LINKS

[New-PSChristmas]()
