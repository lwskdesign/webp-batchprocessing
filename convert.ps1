if ( -not (Test-Path .\imagesOld) ) {
    Write-Host -ForegroundColor Yellow "folder imagesOld missing, creating"
    New-Item -Name "imagesOld" -ItemType "directory" | Out-Null
}

if ( -not (Test-Path .\imagesNew) ) {
    Write-Host -ForegroundColor Yellow "folder imagesNew missing, creating"
    New-Item -Name "imagesNew" -ItemType "directory" | Out-Null
}

$qualityDefault = 85
$qualityPromt = Read-Host "Desired quality [0-100] (Default $qualityDefault)"
$qualityPromt = ($qualityDefault,$qualityPromt)[[bool]$qualityPromt]

$caption = "CONFIRMATION"
$messagen = 'Are you sure you want to proceed using these settings?'
$choices  = '&Yes', '&No'

$confirmation = $Host.UI.PromptForChoice($caption, $message, $choices, 1)
if ($confirmation -eq 0) {
    Get-ChildItem .\imagesOld\ | ForEach-Object {
        $xResolution = 1250
        .\cwebp.exe -q $qualityPromt -resize $xResolution 0 $_.FullName -o .\imagesNew\$($_.BaseName).webp
    }
} else {
    Write-Host -ForegroundColor DarkRed "please launch the script again to change your settings"
    exit
}