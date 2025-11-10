# 0x02 Overview
This lab focuses on troubleshooting network connectivity issues within a VPC. The main problem is that the public server has a direct connection to the app server, 
which violates the intended network design.

in This Lab I investigated the cause of this misconfiguration, analyzed the current security settings, 
and applied the necessary fixes to ensure that only the Bastion server can connect to the app server.

<img width="978" height="664" alt="Scenario_0" src="https://github.com/user-attachments/assets/40db8555-3981-45b1-a149-de44f19829c6" />


## Step 1
Investigating the App server security group and network configuration 
I Investigated found that SSH (port 22) was open to all IPs (0.0.0.0/0), 
violating the policy that only the Bastion host should connect. 
I also confirmed that outbound rules allow only HTTP and HTTPS traffic to any destination.

## Step 2
I tested SSH access to the App Server from both the Bastion Host and the Public Server. 
Using AWS Session Manager, I connected to each public instance, started the ssh-agent, and successfully SSH’ed into the App Server using its private IP. 
From the Bastion Host, this connection was expected and compliant, but connecting from the Public Server worked as well, 
revealing that the current security group incorrectly allows direct SSH from any public host, which violates the policy.

## Step 3
I updated the App Server security group to allow SSH connections only from the Bastion Host’s private IP. 
After editing the inbound rule to replace the open 0.0.0.0/0 source with the Bastion Host IP (/32), 
I tested connectivity. SSH from the Public Server now times out, confirming the connection is blocked, while SSH from the Bastion Host still succeeds.
This change enforces compliance by ensuring only the Bastion Host can access the App Server via SSH.


<img width="919" height="566" alt="Scenario_2" src="https://github.com/user-attachments/assets/29c2b42c-3493-42f5-979d-431e2c3fffe0" />

## 
