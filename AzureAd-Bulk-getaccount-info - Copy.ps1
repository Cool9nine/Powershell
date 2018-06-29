get-azureaduser -Top 2000 | where companyname -EQ dcf | select Displayname,UserPrincipalName,CompanyName,ObjectId,AssignedLicenses,AssignedPlans | export-csv -NoTypeInformation -Append -Path c:\azureAD\DCF-users.csv

get-azureaduser  -Top 2000  | where companyname -EQ dcf | select Displayname,UserPrincipalName,CompanyName,ObjectId,AssignedLicenses,AssignedPlans |out-file -append -FilePath C:\azuread\DCF-users.txt
