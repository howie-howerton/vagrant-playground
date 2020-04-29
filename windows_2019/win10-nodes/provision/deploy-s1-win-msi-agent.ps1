param(
    $S1WinMsiAgent = '',
    $S1SiteToken = ''
)

# $DataStamp = get-date -Format yyyyMMddTHHmmss
# $logFile = '{0}-{1}.log' -f $S1WinMsiAgent,$DataStamp
# $MSIArguments = @(
#     "/i"
#     ('"{0}"' -f $S1WinMsiAgent)
#     "SITE_TOKEN=$S1SiteToken"
#     "/quiet"
#     $logFile
# )
# Start-Process "msiexec.exe" -ArgumentList $MSIArguments -Wait -NoNewWindow

$Args = @(
    "SITE_TOKEN=$S1SiteToken"
    "/quiet"
)

Start-Process C:\vagrant\s1-agents\$S1WinMsiAgent -ArgumentList $Args -Wait
