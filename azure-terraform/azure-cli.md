## 1. Create the Resource Group

```bash=
az group create --name susilnemterraform-rg --location 'eastus'
```

## 2. Create the Storage Account

```bash=
az storage account create \
  --name susilnemtfstate \
  --resource-group susilnemterraform-rg \
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
az group show --name susilnemterraform-rg
az storage account show --name susilnemtfstate --resource-group susilnemterraform-rg
az storage container show --name terraform --account-name susilnemtfstate --auth-mode login
```