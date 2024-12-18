<#
Pester 5.x tests for PSChristmas module
These tests are NOT mocking anything but testing the files and commands
#>
BeforeDiscovery {
   # Import the module manifest
   $module = $PSCommandPath.Replace('.tests.ps1', '.psd1')
   #set a global variable so I can use this in my tests
   $global:ModulePath = Join-Path -Path .. -ChildPath (Split-Path $module -Leaf) -Resolve
   $ModuleName = (Get-Item $global:ModulePath).BaseName
   If (Test-Path $global:ModulePath) {
       Import-Module $global:ModulePath -Force -PassThru
   }
   else {
       Write-Warning "Can't find module at $global:ModulePath"
   }
}

InModuleScope PSChristmas {
   Describe RequiredFiles {
      It "Has a module file" {
         (Get-ChildItem ..\*.psm1).count | Should -Be 1
      }
      It "Has a manifest file" {
         (Get-ChildItem ..\*.psd1).count | Should -Be 1
      }
      It "Has a json data file" {
         (Get-ChildItem ..\data.json).count | Should -Be 1
      }
   }

   Describe Data {
      BeforeAll {
         $script:data = Get-Content ..\data.json | ConvertFrom-Json -ErrorAction Stop
      }

      foreach ($item in ("FirstNames", "Modifiers", "LastNames", "Presents", "Greeting" )) {
         It "Data has a $item property array" {
            $script:data.$item -is [array]
         }
      }
   }

   Describe New-PSChristmas {
      BeforeAll {
         $script:x = New-PSChristmas
      }

      It "Should output a PSChristmas object" {
         $script:x.GetType().Name | Should -Be "PSChristmas"
      }
      It "Should have a string greeting" {
         $script:x.Greeting.GetType().Name | Should -Be "String"
      }
      It "Should have a string Elf name" {
         $script:x.ElfName.GetType().Name | Should -Be "String"
      }
      It "Should have [ListStatus] List" {
         $script:x.List.GetType().Name | Should -Be "ListStatus"
      }
      It "DaysRemaining Should be an integer" {
         $script:x.DaysRemaining.GetType().Name | Should -Be "Int32"
      }
      It "Countdown Should be a string" {
         $script:x.Countdown.GetType().Name | Should -Be "string"
      }
   }

   Describe Get-PSChristmasPresent {
      It "Should run without error and return a single entry" {
         (Get-PSChristmasPresent).Count | Should -Be 1
      }
      It "Should return multiple presents with -Count" {
         (Get-PSChristmasPresent -count 2).Count | Should -Be 2
      }
      It "Should return multiple presents with a positional parameter" {
         (Get-PSChristmasPresent 2).Count | Should -Be 2
      }
      It "Should throw an error if more than 10 presents are requested" {
         { Get-PSChristmasPresent -count 11 -WarningVariable w } | Should -Throw
      }
   }

   Describe New-ElfName {
      BeforeAll {
         $script:n = New-ElfName
      }

      It "Should return a string" {
         $script:n.GetType().Name | Should -Be "String"
      }

      It "Should have a first and last name" {
         $script:n.split().count | Should -Be 2
      }
      It "Should generate multiple names" {
         $n = New-ElfName -count 5
         $n.count | Should -Be 5
      }
      It "Should limit names to 50" {
         {New-ElfName -count 51} | Should -Throw
      }
   }

   Describe New-PSChristmasGreeting {
      BeforeAll {
         $script:g = New-PSChristmasGreeting
      }

      It "Should return a single entry" {
         ($script:g).Count | Should -Be 1
      }

      It "Should output a string" {
         $script:g.getType().name | Should -Be "string"
      }
   }

}