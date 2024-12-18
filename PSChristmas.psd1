#
# Module manifest for PSChristmas
#

@{
    RootModule           = 'PSChristmas.psm1'
    ModuleVersion        = '2.2.0'
    GUID                 = '234a068f-005b-4253-a833-48a25b8b4157'
    Author               = 'Jeff Hicks'
    CompatiblePSEditions = 'Desktop', 'Core'
    CompanyName          = 'JDH Information Technology Solutions, Inc.'
    Copyright            = '2016-2024 JDH Information Technology Solutions, Inc.'
    Description          = 'a demonstration class-based PowerShell module with a number of Christmas related commands.'
    PowerShellVersion    = '5.1'
    FunctionsToExport    = @('New-ElfName', 'Get-PSChristmasPresent', 'New-PSChristmasGreeting',
        'New-PSChristmas', 'Show-PSChristmasMessage', 'Invoke-Jingle', 'Write-Festive')
    VariablesToExport    = 'xmasData'
    AliasesToExport      = 'jingle', 'elfme', 'wf'
    FormatsToProcess      = @('formats/PSChristmas.format.ps1xml')
    PrivateData          = @{
        PSData = @{
            Tags         = 'demonstration', 'christmas', 'powershell-class'
            LicenseUri   = 'https://github.com/jdhitsolutions/PSChristmas/blob/master/LICENSE'
            ProjectUri   = 'https://github.com/jdhitsolutions/PSChristmas'
            ReleaseNotes = @'
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
'@
        }
    }
}
