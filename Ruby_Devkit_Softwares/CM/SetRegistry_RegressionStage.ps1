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

try{


<#
$exePath = "C:\Windows\regedit.exe"
$args = " /S C:\Ruby_Devkit_Softwares\CM\Registry.reg"
$executeReg = $exePath + $args
Invoke-Expression $executeReg
#>

$legalCaptionPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$checklegalCaption = Test-RegistryValue -Path $legalCaptionPath -Name "legalnoticecaption"
$checklegalText = Test-RegistryValue -Path $legalCaptionPath -Name "legalnoticetext"

if($checklegalCaption)
{
    write-host "Renaming legalnoticecaption to legalnoticecaption123"
    Rename-ItemProperty -Path $legalCaptionPath -Name "legalnoticecaption" -NewName "legalnoticecaption123"
}
if($checklegalText)
{
    write-host "Renaming legalnoticetext to legalnoticetext123"
    Rename-ItemProperty -Path $legalCaptionPath -Name "legalnoticetext" -NewName "legalnoticetext123"
}

$outputPath = "C:\Ruby_Devkit_Softwares\CM\V7\features\output"
$outputBackup = "C:\Ruby_Devkit_Softwares\CM\V7\features\Output_Backup"

Copy-Item "$outputPath\*" "$OutputBackup" -Force -Recurse

start-sleep -s 5

Remove-Item "$outputPath\*" -Force -Recurse

Remove-Item "C:\SmokeResults\*" -Force -Recurse


<#write-host "Setting Run Once key .."
$runOncePath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"
New-ItemProperty -Path $runOncePath -Name "Smoke" -Value "C:\Ruby_Devkit_Softwares\CM\Smoke_Result_Prod.bat" 


$autoLogonPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"  
Set-ItemProperty -Path $autoLogonPath -Name "AutoAdminLogon" -Value "1" -type String -Force
Set-ItemProperty -Path $autoLogonPath -Name "DefaultUsername" -Value "108609" -type String  
Set-ItemProperty -Path $autoLogonPath -Name "DefaultPassword" -Value "Merrill15!" -type String
#>
$restart = 1;
}

catch [Exception]
{
write-host "Exception occurred.."
Write-host $_
break
}
finally
{
if($restart -eq "1")
{
write-host "Restarting the machine"
start-sleep -s 10
Restart-Computer -Force
exit 0
break
}
else
{
 write-host "Some exception occured"
 exit -1   
 }
}




