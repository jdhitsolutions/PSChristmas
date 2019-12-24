---
external help file: PSChristmas-help.xml
Module Name: PSChristmas
online version:
schema: 2.0.0
---

# New-ElfName

## SYNOPSIS

Find your inner elf

## SYNTAX

```yaml
New-ElfName [-Count <Int32>] [<CommonParameters>]
```

## DESCRIPTION

This command will provide you a random elf name.

## EXAMPLES

### Example 1

```powershell
PS C:\> New-Elfname
Elsa Mintypuff
```

### Example 2

```powershell
PS C:\> New-Elfname -count 5
Tammy Bignose
Wizzy Glitterbells
Humperdink Littlegas
Doc Fluffypuff
Nutmeg Zanytoe
```

## PARAMETERS

### -Count

Specify the number of names to generate up to 50.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.String

## NOTES

Learn more about PowerShell: http://jdhitsolutions.com/blog/essential-powershell-resources/

## RELATED LINKS

[New-PSChristmas]()
