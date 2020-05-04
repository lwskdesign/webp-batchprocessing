Get-ChildItem .\images_old\ | ForEach-Object {
    .\cwebp.exe -q 100 -resize 1000 1000 $_.FullName -o .\images_new\$($_.BaseName).webp
}