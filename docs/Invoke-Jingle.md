---
external help file: PSChristmas-help.xml
Module Name: PSChristmas
online version: 
schema: 2.0.0
---

# Invoke-Jingle

## SYNOPSIS
Play a Christmas tune

## SYNTAX

```
Invoke-Jingle [-Christmas] <myChristmas>
```

## DESCRIPTION
The command name explains it all. You should pipe a myChristmas object to this function.

## EXAMPLES

### Example 1
```
PS C:\> $xmas | Invoke-Jingle
```

There is no console output.

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
[New-MyChristmas]()
