---
external help file: PSChristmas-help.xml
Module Name: PSChristmas
online version:
schema: 2.0.0
---

# Write-Festive

## SYNOPSIS

Write a festive message to the console

## SYNTAX

```yaml
Write-Festive [-Text] <String> [<CommonParameters>]
```

## DESCRIPTION

This is a silly command that writes a colorized message to the host. The output is written the host using Write-Host with randomly colored foreground and background colors for each letter and space.

## EXAMPLES

### Example 1

```powershell
PS C:\>  Write-Festive "Merry Christmas"
Merry Christmas
```

The output is written the host using Write-Host with randomly colored foreground and background colors for each letter and space.

### Example 2

```powershell
PS C:\> New-PSChristmasGreeting | Write-Festive
Priecīgus Ziemassvētkus
```

The actual output will be colored.

## PARAMETERS

### -Text

Enter a text message

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### None

## NOTES

## RELATED LINKS

[Write-Host]()