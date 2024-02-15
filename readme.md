A better way to deploy Barrel Wisdom. I learned Terraform and Ansible and suddenly I want to solve all of life's problems using them.

# So what does this do?

* Creates necessary infrastructure (VPS, DNS records) to deploy a website.
* Ansible configures the VPS to actually deploy the website.
* Deploys updates on demand.

Why? The old process was just cumbersome.

* Once I started using Docker for development, I had to undo a couple Docker specific settings for production (such as not pointing to the 'postgres' container)
* I would clone my repo and then rsync the Database side of it into a folder. Feels silly now.
* I had to zip up my frontend build, and then I'd generally use Cyberduck to transfer the file.
* Always manually backed up my old files in case something caught on fire. Though in my current implementation, if my backend catches fire, guess I gotta get a backup (have done the backup of shame before) or fix it on the fly.
* Had to import data and migrate DB manually. Now Django has a script that just looks for a dump file. I should make that a loop over every gz file.

# How to use

To build infrastructure, create a `terraform.tfvars` with the following:

```
ssh_key_name         = whatever the digital ocean name is
username             = 
pvt_key              = key location
do_token             = 
cloudflare_api_token =
cloudflare_zone_id   =
domain               = "test.example.com"
pub_key              = 
```

Then run:

```bash
export DIGITALOCEAN_TOKEN="token here"
terraform init
terraform apply
# for updates
ansible-playbook -u user -i '1.1.1.1,' --private-key ~/.ssh/file update-bw.yml
```