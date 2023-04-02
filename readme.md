A better way to deploy Barrel Wisdom. In progress. Terraform confirmed working, need to work on Docker images and some extra configuration.

To build infrastructure, create a `terraform.tfvars` with the following:

```
ssh_key_name         =
username             =
pvt_key              =
do_token             = 
cloudflare_api_token =
cloudflare_zone_id   =
```

Then make a cloud init file at `terraform/user-data.yml`. Current version installs docker and not much else.

Then run:

```bash
export DIGITALOCEAN_TOKEN="token here"
terraform init
terraform apply
ansible-playbook -u user -i '1.1.1.1,' --private-key ~/.ssh/file init.yml
```

## Todos:

* Figure out how to get certbot, etc. going
* Further security measures (disallowing ports, etc)
* Work out the best way to deploy Django
* Figure out data syncing between home and remote device
* Auto generate database credentials on deployment