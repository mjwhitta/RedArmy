$isAdmin = (
    New-Object Security.Principal.WindowsPrincipal(
        [Security.Principal.WindowsIdentity]::GetCurrent()
    )
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# Disable defender if elevated
if ($isAdmin) {
    Set-MpPreference -DisableRealTimeMonitoring $true -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
    if ($?) {
        echo "Real-time monitoring disabled"
    } else {
        throw "Disabling real-time monitoring failed"
    }
} else {
    throw "Run elevated to disable defender"
}
