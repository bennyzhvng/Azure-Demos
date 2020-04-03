$resourceGroupName = "demo"
$storageAccountName = "storagedemo777"
$keyVaultName = "benny-kv-demo"

$storageAccountKey = Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName

# Obtain Storage Account Keys
$primaryKeyName = $storageAccountKey.KeyName[0]
$primaryKeyValue = $storageAccountKey.Value[0]

$secondaryKeyName = $storageAccountKey.KeyName[1]
$secondaryKeyValue = $storageAccountKey.Value[1]

# Convert Storage Account Keys to secure string before storing them in the key vault
$primaryKeyValueSecret = ConvertTo-SecureString $primaryKeyValue -AsPlainText -Force
$secondaryKeyValueSecret = ConvertTo-SecureString $secondaryKeyValue -AsPlainText -Force

# Store Storage Account keys in the Keyvault as Secrets
Set-AzKeyVaultSecret -VaultName $keyVaultName -Name $primaryKeyName -SecretValue $primaryKeyValueSecret
Set-AzKeyVaultSecret -VaultName $keyVaultName -Name $secondaryKeyName -SecretValue $secondaryKeyValueSecret


