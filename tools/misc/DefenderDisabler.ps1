$isAdmin = (
    New-Object Security.Principal.WindowsPrincipal(
        [Security.Principal.WindowsIdentity]::GetCurrent()
    )
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# Disable defender if elevated
if ($isAdmin) {
    Set-MpPreference -DisableIOAVProtection $true -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
    if ($?) {
        echo "IOAVProtection disabled"
    } else {
        throw "Disabling IOAVProtection failed"
    }
} else {
    throw "Run elevated to disable defender"
}
