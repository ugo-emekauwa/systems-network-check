# Systems Availability Check Script, written by Ugo Emekauwa (uemekauw@cisco.com or uemekauwa@gmail.com)

# Start script
Write-Output "$(Get-Date) - Starting Systems Check Script." | Out-File -Append "c:\Logs\systems_check.log"

# Setting up ping command variable
Write-Output "$(Get-Date) - Setting up ping command variable." | Out-File -Append "c:\Logs\systems_check.log"
$ping = New-Object System.Net.NetworkInformation.Ping

# Setting email alert sender
Write-Output "$(Get-Date) - Setting email alert sender." | Out-File -Append "c:\Logs\systems_check.log"
$email_sender = "system-checks@company.org"

# Setting email alert recipients (multiple recipients should be separated by a comma)
Write-Output "$(Get-Date) - Setting email alert recipients." | Out-File -Append "c:\Logs\systems_check.log"
$email_recipients = "net-operations@company.org, it-support@company.org"

# Setting SMTP server for sending email alerts
Write-Output "$(Get-Date) - Setting SMTP server for sending email alerts." | Out-File -Append "c:\Logs\systems_check.log"
$smtp_server = "smtp.company.org"

# Capturing values from system XML file
Write-Output "$(Get-Date) - Capturing values from system XML file." | Out-File -Append "c:\Logs\systems_check.log"
[xml]$systemfile = Get-Content -Path "c:\Systems\system1.xml"

# Pinging server node 1 (attempt to ping will be made for up to 1 minute)
Write-Output "$(Get-Date) - Pinging server $($systemfile.cluster.nodes.node1.name)" | Out-File -Append "c:\Logs\systems_check.log"
Do {
    $result = $ping.Send($systemfile.cluster.nodes.node1.ip_address)
} While ($result.Status -ne "Success" -and $(Get-Date).AddMinutes(1) -gt (Get-Date))

# Log results of the ping attempt for server node 1 and send an email alert if the ping attempt failed
If ($result.Status -ne "Success"){
    Send-MailMessage -From $email_sender -To $email_recipients -Subject "[System Hardware Alert]: Server $($systemfile.cluster.nodes.node1.name) in $($systemfile.cluster.datacenter) is not Responding" -body "BRIEF SUMMARY ON AFFECTED DEVICE: `nName: $($systemfile.cluster.nodes.node1.name) `nSerial Number: $($systemfile.cluster.nodes.node1.serial) `nLocation: $($systemfile.cluster.datacenter) `nTOR: $($systemfile.cluster.tor) `nCluster Device Association: $($systemfile.cluster.name) `n `nISSUE: Please be advised that on $($(Get-Date)), the server node named $($systemfile.cluster.nodes.node1.name) with the serial number $($systemfile.cluster.nodes.node1.serial) under $($systemfile.cluster.name) located in $($systemfile.cluster.datacenter) did not respond to system pings. Please check the cluster server node and/or data center environment. `n `nRESOLUTION: Please verify that there is not a power or cooling issue with the device. If none of the above issues are present, please escalate to the infrastructure team." -SmtpServer $smtp_server
    Write-Output "$(Get-Date) - Server $($systemfile.cluster.nodes.node1.name) is unreachable. Alert notification email sent." | Out-File -Append "c:\Logs\systems_check.log"
} Else {
    Write-Output "$(Get-Date) - Server $($systemfile.cluster.nodes.node1.name) with the serial number $($systemfile.cluster.nodes.node1.serial) under $($systemfile.cluster.name) is online." | Out-File -Append "c:\Logs\systems_check.log"
}

# Pinging server node 2 (Attempt to ping will be made for up to 1 minute)
Write-Output "$(Get-Date) - Pinging server $($systemfile.cluster.nodes.node2.name)" | Out-File -Append "c:\Logs\systems_check.log"
Do {
    $result = $ping.Send($systemfile.cluster.nodes.node2.ip_address)
} While ($result.Status -ne "Success" -and $(Get-Date).AddMinutes(1) -gt (Get-Date))

# Log results of the ping attempt for server node 2 and send an email alert if the ping attempt failed
If ($result.Status -ne "Success"){
    Send-MailMessage -From $email_sender -To $email_recipients -Subject "[System Hardware Alert]: Server $($systemfile.cluster.nodes.node2.name) in $($systemfile.cluster.datacenter) is not Responding" -body "BRIEF SUMMARY ON AFFECTED DEVICE: `nName: $($systemfile.cluster.nodes.node2.name) `nSerial Number: $($systemfile.cluster.nodes.node2.serial) `nLocation: $($systemfile.cluster.datacenter) `nTOR: $($systemfile.cluster.tor) `nCluster Device Association: $($systemfile.cluster.name) `n `nISSUE: Please be advised that on $($(Get-Date)), the server node named $($systemfile.cluster.nodes.node2.name) with the serial number $($systemfile.cluster.nodes.node2.serial) under $($systemfile.cluster.name) located in $($systemfile.cluster.datacenter) did not respond to system pings. Please check the cluster server node and/or data center environment. `n `nRESOLUTION: Please verify that there is not a power or cooling issue with the device. If none of the above issues are present, please escalate to the infrastructure team." -SmtpServer $smtp_server
    Write-Output "$(Get-Date) - Server $($systemfile.cluster.nodes.node2.name) is unreachable. Alert notification email sent." | Out-File -Append "c:\Logs\systems_check.log"
} Else {
    Write-Output "$(Get-Date) - Server $($systemfile.cluster.nodes.node2.name) with the serial number $($systemfile.cluster.nodes.node2.serial) under $($systemfile.cluster.name) is online." | Out-File -Append "c:\Logs\systems_check.log"
}

# Pinging server node 3, sending alert if unavailable (Attempt to ping will be made for up to 1 minute)
Write-Output "$(Get-Date) - Pinging server $($systemfile.cluster.nodes.node3.name)" | Out-File -Append "c:\Logs\systems_check.log"
Do {
    $result = $ping.Send($systemfile.cluster.nodes.node3.ip_address)
} While ($result.Status -ne "Success" -and $(Get-Date).AddMinutes(1) -gt (Get-Date))

# Log results of the ping attempt for server node 3 and send an email alert if the ping attempt failed
$date = get-date
If ($result.Status -ne "Success"){
    Send-MailMessage -From $email_sender -To $email_recipients -Subject "[System Hardware Alert]: Server $($systemfile.cluster.nodes.node3.name) in $($systemfile.cluster.datacenter) is not Responding" -body "BRIEF SUMMARY ON AFFECTED DEVICE: `nName: $($systemfile.cluster.nodes.node3.name) `nSerial Number: $($systemfile.cluster.nodes.node3.serial) `nLocation: $($systemfile.cluster.datacenter) `nTOR: $($systemfile.cluster.tor) `nCluster Device Association: $($systemfile.cluster.name) `n `nISSUE: Please be advised that on $($(Get-Date)), the server node named $($systemfile.cluster.nodes.node3.name) with the serial number $($systemfile.cluster.nodes.node3.serial) under $($systemfile.cluster.name) located in $($systemfile.cluster.datacenter) did not respond to system pings. Please check the cluster server node and/or data center environment. `n `nRESOLUTION: Please verify that there is not a power or cooling issue with the device. If none of the above issues are present, please escalate to the infrastructure team." -SmtpServer $smtp_server
    Write-Output "$(Get-Date) - Server $($systemfile.cluster.nodes.node3.name) is unreachable. Alert notification email sent." | Out-File -Append "c:\Logs\systems_check.log"
} Else {
    Write-Output "$(Get-Date) - Server $($systemfile.cluster.nodes.node3.name) with the serial number $($systemfile.cluster.nodes.node3.serial) under $($systemfile.cluster.name) is online." | Out-File -Append "c:\Logs\systems_check.log"
}

# Exiting script
Write-Output "$(Get-Date) - Systems Check Script complete, exiting." | Out-File -Append "c:\Logs\systems_check.log"
Exit
