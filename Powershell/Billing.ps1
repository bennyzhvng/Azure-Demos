# MSDN Subscription and Tenant
Clear-AzContext -Scope CurrentUser -Force
Connect-AzAccount
Get-AzContext

# For MSDN, "no invoice will be generated if there are no charges"
$invoice = Get-AzBillingInvoice -Latest
Invoke-WebRequest -Uri $invoice.DownloadUrl -OutFile ($home + '\' + $invoice.Name + '.pdf')
