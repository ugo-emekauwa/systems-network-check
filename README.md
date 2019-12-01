# How-To: Automating Systems Availability Network Checks

The sample Microsoft Windows PowerShell script listed in this repository demonstrates how to automate checking the network availability of a targeted system and send an email alert if the system is unresponsive. This can be useful for scenarios that require quickly pre-checking a system's network availability before performing further automation or where a standalone network monitoring platform is unavailable.

## Performing the Availability Check on Targeted System(s)
The sample PowerShell script named **systems_check.ps1** demonstrates how to perform the following primary actions:
1. Obtain information on targeted systems from a specified system XML file.
2. Check availability of targeted systems by attempting to ping the device on the network.
3. Send an email alert to specified parties if the ping attempt failed on the targeted system.

## Providing Alert Information for the Targeted System(s)
The sample XML file named **system1.xml** demonstrates how to setup targeted system information for the **systems_check.ps1** script. In the sample **system1.xml** file, the following information has been provided for three clustered server nodes that will be monitored:
1. Cluster Name
2. Data Center Location
3. Connected Top of the Rack (TOR) Switch
4. Server Node Name
5. Server Hardware Serial Number
6. Server IP Address

## Requirements:
1. Microsoft Windows PowerShell.
2. A reachable SMTP Server.
3. _Optional:_ Task Scheduler on Microsoft Windows or a similar equivalent, for creating a scheduled task/job to run the systems availability check on a set interval.

## Use Cases
A modified version of the **systems_check.ps1** script is part of the automation used to support and enable the following product demonstrations on Cisco dCloud:
1. Cisco HyperFlex Edge with Intersight v1
2. Cisco Unified Computing System 4.0 v1
3. Cisco UCS Management with Intersight v1
4. Cisco UCS 4.0 with Kubernetes - (KUBaM) v1
5. Cisco UCS Central 2.0 v1
6. Cisco UCS Central 2.0 Lab v1

## Author:
Ugo Emekauwa

## Contact Information:
uemekauw@cisco.com or uemekauwa@gmail.com
