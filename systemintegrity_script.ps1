Write-Host "System Integrity PowerShell Script"

$result = @{}
# $result = Get-ChildItem * -include *.dll,*.exe,*.sys |
$result = Get-ChildItem * -include *.txt |

ForEach-Object {
    [pscustomobject] @{
        File = $_.fullname
        Hash = (Get-Filehash $_.fullname -algorithm md5).hash
}}

if ($result.length -lt 1) {
        # write-host "no files found"
    } else {
        $result | Format-Table -auto | Out-File res.txt
        $result | Format-Table -auto 
    }
Write-Host "files found: "  $result.length