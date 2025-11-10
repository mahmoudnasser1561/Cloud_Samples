# 0x00

## Project Structure
- development/: Config for a dev environment.
- production/: Prod config with terraform.tfvars for real-world overrides.
- staging/: Staging setup.

Each env has main.tf (core resources), variables.tf (inputs), outputs.tf (results), and providers.tf (AWS setup).

#### The setup provisions:
- A VPC in us-east-1.
- Public and private subnets.
- Route tables for internet access.
- Security groups to control traffic.
- An EC2 instance in the public subnet with sample IPs (e.g., 10.0.0.16, 10.0.0.24).
  
## Arch diagram
<img width="1121" height="1001" alt="VPC drawio" src="https://github.com/user-attachments/assets/f24136a8-2853-49e3-b713-600161ab0415" />
