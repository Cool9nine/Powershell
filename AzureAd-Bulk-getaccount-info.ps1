$var = "DCF"
$users = get-azureaduser  -Top 30000  | where companyname -EQ $var | sort

foreach ($User in $Users) {
Get-AzureADUser -objectiD $User.ObjectId | Select -Property displayname,UserPrincipalName,companyname -ExpandProperty AssignedPlans |export-csv -NoTypeInformation -Append -Path c:\azureAD\$var-User-AssignedPlans.csv
#Get-AzureADUser -objectiD $User.ObjectId | Select -Property displayname,UserPrincipalName,companyname -ExpandProperty ProvisionedPlans |export-csv -NoTypeInformation -Append -Path c:\azureAD\$var-User-ProvisionedPlans.csv
Get-AzureADUser -objectiD $User.ObjectId | Select -Property displayname,UserPrincipalName,companyname -ExpandProperty AssignedLicenses | export-csv -NoTypeInformation -Append -Path c:\azureAD\$var-User-AssignedLicenses.csv
}
