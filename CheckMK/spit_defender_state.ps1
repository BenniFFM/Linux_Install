#####################################################################################################################
#  ScriptName: spit_defender_state.ps1
#
#  Description:
#  This plugin gets the status information of Windows Defender and System Center Endpoint Protection. Make sure
#  that Windows Defender or System Center Endpoint Protection is installed on the machine!
#
#  Author: Dvorak Michael - specialis IT GmbH
#####################################################################################################################
#  Version History
#  1.0 - 2021-12-26 - initial Release
#####################################################################################################################

# get the OS version
$osVersion = [Environment]::OSVersion.Version.Major

$cmdExists = $false

# check if OS version is Win8/WinServer2012
if ($osVersion -eq 6) {

    if (Test-Path -Path "C:\Program Files\Microsoft Security Client\MpProvider\MpProvider.psd1") {

        Import-Module "C:\Program Files\Microsoft Security Client\MpProvider\MpProvider.psd1" -ErrorAction Ignore
        
        $cmdExists = Get-Command Get-MProtComputerStatus -ErrorAction SilentlyContinue

        if ($cmdExists) { $avObj = Get-MProtComputerStatus }
    }
    
} else {
    
    $cmdExists = Get-Command Get-MpComputerStatus -ErrorAction SilentlyContinue
    
    if ($cmdExists) { $avObj = Get-MpComputerStatus }     
}

if (!$cmdExists) { exit }

Function formatValue($value) {
    return ($value.ToString()).Replace(' ','-')
   #if($value){return ($value.ToString()).Replace(' ','-')}else{return $null}
}

$values = @($osVersion)
$values += formatValue($avObj.AMEngineVersion)
$values += formatValue($avObj.AMProductVersion)
$values += formatValue($avObj.AMServiceEnabled)
$values += formatValue($avObj.AMServiceVersion)       
$values += formatValue($avObj.AntispywareEnabled)     
$values += formatValue($avObj.AntispywareSignatureAge)     
$values += formatValue($avObj.AntispywareSignatureLastUpdated) 
$values += formatValue($avObj.AntispywareSignatureVersion)        
$values += formatValue($avObj.AntivirusEnabled)        
$values += formatValue($avObj.AntivirusSignatureAge)        
$values += formatValue($avObj.AntivirusSignatureLastUpdated)        
$values += formatValue($avObj.AntivirusSignatureVersion)        
$values += formatValue($avObj.BehaviorMonitorEnabled)        
$values += formatValue($avObj.IoavProtectionEnabled)        
$values += formatValue($avObj.NISEnabled)        
$values += formatValue($avObj.NISEngineVersion)       
if ($osVersion -eq 6) { $values += formatValue(0) } else { $values += formatValue($avObj.NISSignatureAge) }        
if ($osVersion -eq 6) { $values += formatValue("N/A") } else { $values += formatValue($avObj.NISSignatureLastUpdated) }        
$values += formatValue($avObj.NISSignatureVersion)        
$values += formatValue($avObj.OnAccessProtectionEnabled)         
$values += formatValue($avObj.QuickScanAge)        
$values += formatValue($avObj.QuickScanEndTime)        
$values += formatValue($avObj.QuickScanStartTime)       
$values += formatValue($avObj.RealTimeProtectionEnabled)        

Write-Output "<<<spit_defender_state>>>"
[System.String]::Join(" ",$values)
