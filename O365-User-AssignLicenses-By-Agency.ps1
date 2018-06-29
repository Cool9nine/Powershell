$var = "DOIT"

$Users = get-azureaduser -Top 20000 | where companyname -EQ $var


#$User = Get-AzureAdUser -objectiD ALAN.SCHUBERTH@ct.gov
 foreach ($User in $Users) {

Set-AzureADUser -ObjectId $User.ObjectId -UsageLocation US
 
$E3License = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense
#$EMSLicense = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense
 
#$E3License.SkuId = "535a3a29-c5f0-42fe-8215-d3b9e1f38c4a"

$E3License.SkuId = "ff5a82be-1edd-4d48-94e0-52527825b589"

#$EMSLicense.SkuId = "efccb6f7-5641-4e0e-bd10-b4976e1bf68e"
 
$LicensesToAssign = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
 
$LicensesToAssign.AddLicenses = $E3License #,$EMSLicense
Set-AzureADUserLicense -ObjectId $User.ObjectId -AssignedLicenses $LicensesToAssign 

}

