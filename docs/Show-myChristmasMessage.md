---
external help file: PSChristmas-help.xml
Module Name: PSChristmas
online version: 
schema: 2.0.0
---

# Show-myChristmasMessage

## SYNOPSIS
{{Fill in the Synopsis}}

## SYNTAX

```
Show-myChristmasMessage [-Christmas] <myChristmas>
```

## DESCRIPTION
Display a holiday themed message to the console. This function does not write anything to the pipeline.

## EXAMPLES

### Example 1
```
PS C:\> $xmas | Show-myChristmasMessage
```

Pipe a myChristmas object to this command to write a special message to the console.

## PARAMETERS

### -Christmas
An object created with New-MyChristmas

```yaml
Type: myChristmas
Parameter Sets: (All)
Aliases: 

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

## INPUTS

### myChristmas

## OUTPUTS

### none

## NOTES
Learn more about PowerShell: http://jdhitsolutions.com/blog/essential-powershell-resources/

## RELATED LINKS
[New-myChristmas]()

