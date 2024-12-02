---
external help file: PSChristmas-help.xml
Module Name: PSChristmas
online version:
schema: 2.0.0
---

# New-PSChristmas

## SYNOPSIS

Create a custom Christmas object

## SYNTAX

```yaml
New-PSChristmas
```

## DESCRIPTION

This is a class-based function that creates a PSChristmas object. You can save this object to a variable and pipe it to other commands in the PSChristmas module.

## EXAMPLES

### Example 1

```powershell
PS C:\> New-PSChristmas

   Holiday Message: Vesel Božič

ElfName           List ChristmasDay Days   CountDown
-------           ---- ------------ ----   ---------
Snookums Pinkpuff Nice  Wednesday     22 22.06:06:09
```

The module uses a custom formatting file for the default output which uses ANSI escape sequences to stylize the output.

## PARAMETERS

## INPUTS

### None

## OUTPUTS

### PSChristmas

## NOTES

Learn more about PowerShell: http://jdhitsolutions.com/blog/essential-powershell-resources/

## RELATED LINKS

[Invoke-Jingle]()

[Show-PSChristmasMessage]()
