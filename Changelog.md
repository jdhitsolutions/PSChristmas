# ChangeLog for PSChristmas

## [Unreleased]

## [2.2.0] - 2024-12-02

### Added

- Added a custom form file for PSChristmas objects
- Added new items to the data json file

### Changed

- Converted Changelog format
- License update
- Code cleanup and module reorganization
- Updated Pester tests to version 5.x
- Updated `README`

### Fixed

- Fixed duplicate gifts

## [v2.1.0] - 2019-12-24

- Updated `Show-PSChristmas` to not require a PSChristmas object
- Updated `New-ElfName` to generate up to 50 names
- Help updates
- Updated `README.md`

## [v2.0.0] - 2019-12-06

- fixed alias export bug
- code restructuring and cleanup
- Added `Write-Festive` command
- Added error handling in case `$XmasData` is missing
- Changed nouns from MyChristmas to PSChristmas
- Changed class from myChristmas to PSChristmas
- Added new items to data file

## [v1.2.0] - 2018-12-04

- exported xmasData variable (Issue #5)
- minor code cleanup
- minor updates to module manifest
- updates to json data
- moved alias definitions to functions
- modified private function that displays graphic to not clear the host
- updated README
- updated help

## [v1.1.0] - 2017-12-11

- updated json data file (Issue #2)
- removed duplicate present in json data file (Issue #3)
- Modified build json file to encode file as Unicode (Issue #4)
- Modified parameter validation for `Get-MyChristmasPresent` (Issue #1)

## v1.0.0 - 2017-12-09

- renamed some of the functions for uniqueness and consistency
- updated for official release
- added documentation

## v0.0.6 - 2016-12-21

- Updated Pester tests
- Modified module to dot source functions using $PSScriptRoot
- updated manifest

## v0.0.5 - 2016-12-20

- Added Pester tests

## v0.0.4 - 2016-12-20

- Added new property to show day of the week for Christmas
- Added new functions to show graphics and play tune
- revised README
- updated manifest

## v0.0.3 - 2016-12-20

- added functions to create Christmas object
- moved text lists to a json file
- Updated manifest

## v0.0.2 - 2016-12-20

- added module manifest

## v0.0.1 - 2016-12-20

- Initial build


[Unreleased]: https://github.com/jdhitsolutions/PSChristmas/compare/v2.2.0..HEAD
[2.2.0]: https://github.com/jdhitsolutions/PSChristmas/compare/vv2.1.0..v2.2.0
[v2.1.0]: https://github.com/jdhitsolutions/PSChristmas/compare/v2.0.0..v2.1.0
[v2.0.0]: https://github.com/jdhitsolutions/PSChristmas/compare/v1.2.0..v2.0.0
[v1.2.0]: https://github.com/jdhitsolutions/PSChristmas/compare/v1.1.0..v1.2.0
[v1.1.0]: https://github.com/jdhitsolutions/PSChristmas/compare/v1.0.0..v1.1.0