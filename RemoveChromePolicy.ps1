param([Int32]$EventID)

$PolicyPath = 'HKLM:\Software\Policies\Google\Chrome'
$ResultFile = 'C:\bin\RemovePolicyResult.csv'

# Setup
If (!(Test-Path $ResultFile)) {
    Write-Output "date;runMessage;didExist;wasRemoved;EventID" | Out-File $ResultFile -Encoding utf8 -Force
}

$date = Get-Date
$date = $date -replace "`t|`n|`r",""

$runMessage = ""
$wasRemoved = 0
$didExist = 0

# Perform check and removal
If (Test-Path $PolicyPath) {
    $error.clear()
    $didExist = 1
    Remove-Item -Recurse -Path $PolicyPath
    If ($error) {
        $runMessage = "`"$error`"" -replace "`t|`n|`r",""
        $wasRemoved = 0
    } else {
        $wasRemoved = 1
        $runMessage = "`"$PolicyPath exists, removed`""
    }
} Else {
    $didExist = 0
    $wasRemoved = 0
    $runMessage = "`"$PolicyPath did not exist`""
}

# Log
Write-Output "$date;$runMessage;$didExist;$wasRemoved;$EventID" | Out-File $ResultFile -Encoding utf8 -Force -Append
