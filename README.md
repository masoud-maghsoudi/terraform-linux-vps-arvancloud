# terraform-linux-vps-arvancloud

## About

This project helps to create a fleet of Linux VPS bound with specific SSH key in ArvanCloud Service provider using Terraform. 4 modules have been developed in this project for different Linux distributions specified below:

- CentOS
  - 7
- Debian
  - 10 (Buster)
  - 11 (Bullseye)
  - 12 (Bookworm)
- Rocky
  - 8.5
  - 9
- Ubuntu
  - 18.04 (Bionic)
  - 20.04 (Focal)
  - 22.04 (Jammy)

you can have a combination of linux machines from different distribiutions at the same time. even you can make customized OS template in your Arvanclpud [panel](https://panel.arvancloud.ir) and add it as module to the code and call it in `main.tf` file.

## Example

before running code you are required to get `API key` from your Arvancloud [panel](https://panel.arvancloud.ir) and set it in `terraform.tfvars`:

```ini
ApiKey = "someapikey0123456789"
```

based on Arvancloud access regions at the time of writing this document, you can assign variable `region` with one of options below:

| Region alias | Description                                |
| ------------ | ------------------------------------------ |
| ir-thr-c1    | Simin Datacenter located in Iran, Tehran   |
| ir-thr-c2    | Forough Datacenter located in Iran, Tehran |
| ir-tbz-dc1   | Shahr Datacenter located in Iran, Tabriz   |
| ir-thr-w1    | Forough Datacenter located in Iran, Tehran |

for example, if you intend to provision a infrastructure in Tabriz datacenter set this in `teraform.tafvars`:

```ini
region = "ir-tbz-dc1"
```

if you are not familiar with SSH keypairs, read [this](https://docs.oracle.com/en/cloud/cloud-at-customer/occ-get-started/generate-ssh-key-pair.html) instruction to generate an SSH keypair. in order to access your machines via SSH you need to set variable `public-key` in `terraform.tfvars` with the content of your generated public key file usually found in `~/.ssh/id_rsa.pub`. please consider keeping your private key securely.

```ini
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCmUs3m50UiEyBuswzg8gAUtI0ewRTHiqT6k1bsLCX3YWDrC7k+uLvBnxHoyKdCMedAg95Wf+rIc4Ph86m+LNyKrYN1Pji4/toWhNH1dQN5edadCnZXe9TrFwNIRfCSVsp1PDedAdvLut5V0mGLOA9l/iILjaCM+hw9ljV9XFnB5Na80R2T1C7oFXn2/bxp1+QCC5eUnVh3WkG9C9HNSh27eLP/mAW7OIhyt6PV5yOd8AtjIFoCAO0cCyMiH4btB488jWGezx47jRnfYBIHjkL9CnvkccAx3YSAiTcikIUJUDk3O+ptrkKckJ75Ea2yzMzvcAYhVEGrkw5gNzpX8x5R"
```

variable `server_count` is equivalent to the number of instances you wish to deploy, which is `0` by default. consider setting this parameter in `terraform.tfvars` before apply. for example if you want to create 3 instance from `Ubunut` and 2 instances of `Rocky Linux`:

```ini
server_count_rocky  = 2
server-count-ubuntu = 3
```

each module has a variable named `image-name` which could be set in module call in `main.tf` file. their default value is set to the latest version of each distribiution at the time of writing this document.

```terraform
module "server-ubuntu" {
  source       = "./modules/server-ubuntu"
  region       = var.region
  ApiKey       = var.ApiKey
  key_name     = arvan_iaas_sshkey.ssh-key-user-terraform.name
  server-count = var.server-count-ubuntu
  image-name   = "Ubunut/18.04"
}
```

## License

MIT

## Author Information

| Author | Masoud Maghsoudi                      |
| ------ | ------------------------------------- |
| Email  | <masoud_maghsopudi@yahoo.com>         |
| Github | <https://github.com/masoud-maghsoudi> |
