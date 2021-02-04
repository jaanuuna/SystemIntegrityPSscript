write-host "System Integrity PowerShell Script"

$result = @{}
#  $result = get-childitem * -include *.dll,*.exe,*.sys |
$result = get-childitem * -include *.txt |

foreach{
    [pscustomobject] @{
        File = $_.fullname
        Hash = (get-filehash $_.fullname -algorithm md5).hash
}}

if ($result.length -lt 1) {
        # write-host "no files found"
    } else {
        $result | format-table -auto |out-file res.txt
        $result | format-table -auto 
    }
write-host "files found: "  $result.length