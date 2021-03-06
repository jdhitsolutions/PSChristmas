# ChangeLog for PSChristmas

## v2.1.0

+ Updated `Show-PSChristmas` to not require a PSChristmas object
+ Updated `New-Elfname` to generate up to 50 names
+ Help updates
+ Updated `README.md`

## v2.0.0

+ fixed alias export bug
+ code restructuring and cleanup
+ Added `Write-Festive` command
+ Added error handling in case `$XmasData` is missing
+ Changed nouns from MyChristmas to PSChristmas
+ Changed class from myChristmas to PSChristmas
+ Added new items to data file

## v1.2.0

+ exported xmasData variable (Issue #5)
+ minor code cleanup
+ minor updates to module manifest
+ updates to json data
+ moved alias definitions to functions
+ modified private function that displays graphic to not clear the host
+ updated README
+ updated help

## v1.1.0

+ updated json data file (Issue #2)
+ removed duplicate present in json data file (Issue #3)
+ Modified build json file to encode file as Unicode (Issue #4)
+ Modified parameter validation for `Get-MyChristmasPresent` (Issue #1)

## v1.0.0

+ renamed some of the functions for uniqueness and consistency
+ updated for official release
+ added documentation

## v0.0.6

+ Updated Pester tests
+ Modified module to dot source functions using $PSScriptRoot
+ updated manifest

## v0.0.5

+ Added Pester tests

## v0.0.4

+ Added new property to show day of the week for Christmas
+ Added new functions to show graphics and play tune
+ revised README
+ updated manifest

## v0.0.3

+ added functions to create Christmas object
+ moved text lists to a json file
+ Updated manifest

## v0.0.2

+ added module manifest

## v0.0.1

+ Initial build

