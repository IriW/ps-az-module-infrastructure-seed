<# 
 .Synopsis 
 Creates basic infrastructure items for customers. 
 .Description 
 Creates defined amount of Resource Groups in desired locations. 
 Names are following scheme "CustomerNameIndex", eg. 
 -IRI1 
 -IRI2 
 and so on. 
 .Parameter customerName 
 Name of customer. 
 .Parameter amount 
 Amount of Resource Groups to deploy. 
 Get-Location to
 .Parameter location 
 Location where Resource Groups should be deployed. 
 Use: 
 Get-AzLocation |Select-Object Location, DisplayName 
 to find available locations. 
 .Example 
 # Deploys 3 Resource Groups in West Europe. 
 New-IRIAzInfrastructureSeed -customerName "IRI" -amount "3" -location "westeurope" 
#>
function New-IRIAzInfrastructureSeed { 
    param( 
    [string]$customerName = "IRIStudent",
    [int]$amount = "4",
    [string]$location = 'WestEurope'
    ) 
    for ($index = 1; $index -le $amount; $index++) { 
    $rGName = "$customerName" + "$index"
    New-AzResourceGroup -name $rGName -location $location
    } 
   }
   Export-ModuleMember -Function New-IRIAzInfrastructureSeed