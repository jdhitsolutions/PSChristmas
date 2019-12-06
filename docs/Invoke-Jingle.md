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

```yaml
Invoke-Jingle [-Christmas] <PSChristmas>
```

## DESCRIPTION

The command name explains it all. You can pipe a myChristmas object to this function, otherwise it will create one on the fly.

## EXAMPLES

### Example 1

```powershell
PS C:\>Invoke-Jingle
Nollaig Chridheil, Diogones Furrylobes

```

There is no pipeline output. A message is written to the console using Write-Host.

## PARAMETERS

### -Christmas

An object created with New-PSChristmas

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

### None

## NOTES

Learn more about PowerShell: http://jdhitsolutions.com/blog/essential-powershell-resources/

## RELATED LINKS

[New-PSChristmas]()
