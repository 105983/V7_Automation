Function Test-RegistryValue {
param(
    [Alias("PSPath")]
    [Parameter(Position = 0, Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [String]$Path
    ,
    [Parameter(Position = 1, Mandatory = $true)]
    [String]$Name    
    ,
    [Switch]$PassThru   
) 
process {
    if (Test-Path $Path) {
        $Key = Get-Item -LiteralPath $Path
        if ($Key.GetValue($Name, $null) -ne $null) {
            if ($PassThru) {
                Get-ItemProperty $Path $Name
            } else {
                $true
            }
        } else {
            $false
        }
    } else {
        $false
    }
}
}
try
{



$outputPath = "C:\Ruby_Devkit_Softwares\CM\V7\features\output"
$htmlStatus = 0

#wait for 10 minutes
$timeout = new-timespan -Minutes 10
$sw = [diagnostics.stopwatch]::StartNew()

while ($sw.elapsed -lt $timeout){
    $checkHTMLFile = Test-Path $outputPath\*.html 
     If($checkHTMLFile)
    {
         Write-Host "Test case execution in progress ..."         
         $htmlStatus = 1
         break
    }
    start-sleep -seconds 120
} 
if($htmlStatus -eq "0")
{
    write-host "Timed out. No HTML file found in the output folder."
    write-host "Exit with failure due to HTML file not found .."
    exit -1
}

$smokeResultPath = gci -Path $outputPath -Recurse -Filter "Stage_Regression_Result*" | Sort-Object -Property Lastwritetime -Descending | select FullName -First 1
$smokeFilePath = $smokeResultPath.FullName
Write-Host "Smoke Result File Path is " $smokeFilePath

$wordToFind = "JenkinsExit"

#wait for 60 minutes
$timeout = new-timespan -Minutes 60
$sw = [diagnostics.stopwatch]::StartNew()

while ($sw.elapsed -lt $timeout){
    $file = Get-Content $smokeFilePath
    $containsWord = $file | %{$_ -match $wordToFind}
    If($containsWord -contains $true)
    {
         Write-Host "All test case completed"
         $status = 1
         break
    }
    start-sleep -seconds 120
} 

if($status -eq "0")
{
    write-host "Timed out. JenkinsExit word not found in HTML file."
    write-host "Exit with failure due to time out.."
    exit -1
}

start-sleep -s 20


$executionStatus = gci -Recurse -Filter "Scenario_Execution_Status*" | Sort-Object -Property Lastwritetime -Descending | select FullName -First 1

$file = Get-Content $executionStatus.FullName
Write-Host "Scenario File Path is " $executionStatus.FullName
$wordToFind = "failed"
$containsWord = $file | %{$_ -match $wordToFind}
If($containsWord -contains $true)
{
    Write-Host "Some of the test cases are failed. Please view the HTML report for more details"
    $returnCode = 1
   # exit -1
}
else
{
    Write-Host "All the test cases passed"
    $returnCode = 0
    #exit 0
}

$SmokeResultsPath = "C:\SmokeResults"
$outputPath = "C:\Ruby_Devkit_Softwares\CM\V7\features\output"
Copy-Item "$outputPath\*" "$SmokeResultsPath" -Force -Recurse

write-host "Return code is " $returnCode
}

catch [Exception]
{
write-host "Exception occurred.."
Write-host $_
break
}
finally
{
$path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$checklegalCaption = Test-RegistryValue -Path $path -Name "legalnoticecaption123"
$checklegalText = Test-RegistryValue -Path $path -Name "legalnoticetext123"

if($checklegalCaption)
{
    write-host "Renaming legalnoticecaption123 to legalnoticecaption"
   # Rename-ItemProperty -Path $path -Name "legalnoticecaption123" -NewName "legalnoticecaption"
}
if($checklegalText)
{
    write-host "Renaming legalnoticetext123 to legalnoticetext"
 #   Rename-ItemProperty -Path $path -Name "legalnoticetext123" -NewName "legalnoticetext"
}
write-host " In finally block"
if($returnCode -eq "0")
{
   exit 0
}
else
{
exit -1
}

}


