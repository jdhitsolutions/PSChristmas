# PSChristmas

This project is a demonstration class based PowerShell module. The root module contains a simple enumeration and a class definition. Most of the class methods have been moved to an external set of helper functions.

## Using the class
In order for the user of the module to not have to understand how to work with objects and classes, the module contains a function to create a new instance of the class called New-MyChristmas.

```
$X = New-MyChristmas
```

This object will look like this:

```
Greeting      : Mutlu Noeller
ElfName       : Toby Crinkleknicker
List          : Naughty
Day           : Sunday
DaysRemaining : 5
CountDown     : 4.14:45:50
```
If you examine the object with Get-Member you will see a few methods.

```
   TypeName: myChristmas

Name          MemberType Definition                    
----          ---------- ----------                    
Equals        Method     bool Equals(System.Object obj)
GetHashCode   Method     int GetHashCode()             
GetType       Method     type GetType()                
Play          Method     void Play()                   
Refresh       Method     void Refresh()                
Show          Method     void Show()                   
ToString      Method     string ToString()             
CountDown     Property   string CountDown {get;set;}   
Day           Property   string Day {get;set;}         
DaysRemaining Property   int DaysRemaining {get;set;}  
ElfName       Property   string ElfName {get;set;}     
Greeting      Property   string Greeting {get;set;}    
List          Property   ListStatus List {get;set;}    
```

However, the user can use the module functions to invoke these methods. The functions are designed to invoke the method.

```
$x | Invoke-Jingle
$x | Show-Message
```
## Helper Functions

The module includes several other functions, some of which are exported for the user to manually run.

```
PS C:\> get-command -Module PSChristmas

CommandType     Name                                               Version    Source                   
-----------     ----                                               -------    ------                   
Function        Get-Present                                        0.0.4      PSChristmas              
Function        Invoke-Jingle                                      0.0.4      PSChristmas              
Function        New-ElfName                                        0.0.4      PSChristmas              
Function        New-Greeting                                       0.0.4      PSChristmas              
Function        New-MyChristmas                                    0.0.4      PSChristmas              
Function        Show-Message                                       0.0.4      PSChristmas              
```
One benefit of having external functions is that they are easier to test with something like Pester or update without having to modify the class definition.

## Data
Some of the functions rely on text lists and randomization. Those lists have been moved to a json file. The json file is imported in the module and turned into an object.

```
$xmasData = Get-Content .\data.json | ConvertFrom-Json
```
The data can then be used in a function like this:

```
$presents = $xmasData.presents | Get-Random -count $Count
```
One benefit of using the json file as opposed to an enumeration is that the latter doesn't like spaces in the values. But using a format like json allows entries like "coloring book". In addition, if you wanted to add more entries, you only have to modify the json file and not any of the code.

*Last Updated 20 December 2016*