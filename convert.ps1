if ( -not (Test-Path .\imagesOld) ) {
    Write-Host -ForegroundColor Yellow "folder imagesOld missing, creating"
    New-Item -Name "imagesOld" -ItemType "directory" | Out-Null
}

if ( -not (Test-Path .\imagesNew) ) {
    Write-Host -ForegroundColor Yellow "folder imagesNew missing, creating"
    New-Item -Name "imagesNew" -ItemType "directory" | Out-Null
}

$xResDefault = 500
$xResPromt = Read-Host "Provide output x-resolution (Default $xResDefault)"
$xResPromt = ($xResDefault,$xResPromt)[[bool]$xResPromt]

$yResDefault = 500
$yResPromt = Read-Host "Provide output y-resolution (Default $yResDefault)"
$yResPromt = ($yResDefault,$yResPromt)[[bool]$yResPromt]

$qualityDefault = 100
$qualityPromt = Read-Host "Desired quiality [0-100] (Default $qualityDefault)"
$qualityPromt = ($qualityDefault,$qualityPromt)[[bool]$qualityPromt]

$caption = "CONFIRMATION"
$messagen = 'Are you sure you want to proceed using these settings?'
$choices  = '&Yes', '&No'

$confirmation = $Host.UI.PromptForChoice($caption, $message, $choices, 1)
if ($confirmation -eq 0) {
    Get-ChildItem .\imagesOld\ | ForEach-Object {
        .\cwebp.exe -q $qualityPromt -resize $xResPromt $yResPromt $_.FullName -o .\imagesNew\$($_.BaseName).webp
    }
} else {
    Write-Host -ForegroundColor DarkRed "please launch the script again to change your settings"
    exit
}