# Azure Internal Subscription and Tenant
Clear-AzContext -Scope CurrentUser -Force
Connect-AzAccount
Get-AzContext

$resourceGroupName = "AAAG"
$location = "AustraliaEast"

New-AzResourceGroup -Name $resourceGroupName -Location $location

$DeploymentMode = "Incremental"

Test-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "C:\Users\ziyzhang\Documents\Demo\simplevm.json" -Mode $DeploymentMode
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "C:\Users\ziyzhang\Documents\Demo\simplevm.json" -Mode $DeploymentMode

# New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateUri https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-vm-simple-windows/azuredeploy.json