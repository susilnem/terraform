## 1. Create the Resource Group

```bash=
az group create --name susilnemterraformstate-rg --location 'eastus'
```

## 2. Create the Storage Account

```bash=
az storage account create \
  --name susilnemtfstate \
  --resource-group susilnemterraformstate-rg \
  --location 'eastus' \
  --sku Standard_LRS \
  --encryption-services blob
```

## 3. Create the Storage Container
```bash=
az storage container create \
  --name terraform \
  --account-name susilnemtfstate \
  --auth-mode login
```


## 4. Verify the Resources
```bash=
az group show --name susilnemterraformstate-rg
az storage account show --name susilnemtfstate --resource-group susilnemterraformstate-rg
az storage container show --name terraform --account-name susilnemtfstate --auth-mode login
```
