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
Show-PSChristmasMessage [-Christmas] <PSChristmas>
```

## DESCRIPTION

Display a holiday themed message to the console. This function does not write anything to the pipeline.

## EXAMPLES

### Example 1

```powershell
PS C:\> New-PSChristmas | Show-PSChristmasMessage
```

Pipe a PSChristmas object to this command to write a special message to the console.

## PARAMETERS

### -Christmas

An object created with New-PSChristmas

```yaml
Type: PSChristmas
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

## INPUTS

### PSChristmas

## OUTPUTS

### none

## NOTES

Learn more about PowerShell: http://jdhitsolutions.com/blog/essential-powershell-resources/

## RELATED LINKS

[New-PSChristmas]()

