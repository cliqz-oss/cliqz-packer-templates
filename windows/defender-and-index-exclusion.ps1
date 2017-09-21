Add-MpPreference -ExclusionPath "c:\jenkins\workspace"

$obj = Get-WmiObject -Class Win32_Volume -Filter "DriveLetter='C:'"
$indexing = $obj.IndexingEnabled
if("$indexing" -eq $True){
    write-host "Disabling indexing of C:"
    $obj | Set-WmiInstance -Arguments @{IndexingEnabled=$False} | Out-Null
}