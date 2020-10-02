#Module Install
Install-Module -Name AsBuiltReport
Install-Module -Name AsBuiltReport.Core
Install-Module -Name AsBuiltReport.VMware.vSphere
Install-Module -Name AsBuiltReport.VMware.ESXi
Install-Module VMware.PowerCLI
Set-PowerCLIConfiguration -Scope User -ParticipateInCeip $false -Confirm:$false
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore

#Server Configuration
New-Item -Path C:\AsBuiltReport\Config -ItemType Directory -Force
New-AsBuiltConfig 

Get-Credential -Message "Enter vCenter credentials" | Export-Clixml -Path C:\AsBuiltReport\Config\AsBuiltCredentials.xml