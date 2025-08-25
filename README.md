<h1>Deploying Interface VPC endpoints for SSM with Terraform</h1>

For this part of our project, we’re going to create two VPC endpoints for SSM: one for the SSM service and another for SSM messages. With these endpoints in place, our SSM interactions will be more secure since the traffic will be routed through AWS’s private network rather than the public internet.
To do this, we’re not going to create a new module because not everything needs to be one! Instead, we’ll add our VPC endpoints to our root main.tf file.

<h2>VPC Endpoints in the Root Variables File</h2>
First, let’s create a new variables.tf file in our root directory, and then add a vpc_endpoints variable:
variables.tf

<img width="443" height="190" alt="image" src="https://github.com/user-attachments/assets/8a6d4eff-93e0-42fc-900c-a73bf88fe6f6" />

We’ll now be able to reference this variable in our resource blocks.

<h2>Creating the VPC Endpoints</h2>
Still in the root directory, let’s add the following:
main.tf  file

<img width="656" height="287" alt="image" src="https://github.com/user-attachments/assets/aa5ff2c4-b0f4-41b3-9879-1069245241a3" />

This first resource block creates the VPC endpoints for SSM.

for_each is a meta-argument defined by the Terraform language. It can be used with modules and with every resource type.
The for_each meta-argument accepts a map or a set of strings, and creates an instance for each item in that map or set. Each instance has a distinct infrastructure object associated with it, and each is separately created, updated, or destroyed when the configuration is applied.

<h2>Creating the security group and associated rule</h2>

Now let’s create the security group with an ingress rule:

<img width="860" height="338" alt="image" src="https://github.com/user-attachments/assets/d4ee0ded-dcfc-4f18-92ef-ae47ef699e2b" />

We’ve got everything we need to test deployment of our VPC endpoints and security group, so let’s go ahead and do that in the next section. 

<h1>Deploying Interface VPC endpoints for SSM with Terraform</h1>

 <h2>Configure your AWS CLI</h2>

 <img width="686" height="125" alt="image" src="https://github.com/user-attachments/assets/1a8d1677-8f8c-40d2-9b56-21bc68abcd9d" />

 Run the terraform init command to initializes the working directory containing  our Terraform configuration files

 <img width="490" height="260" alt="image" src="https://github.com/user-attachments/assets/88be9157-f2f5-43ee-8a0b-b24e73fe7d07" />

 Run terraform validate to the configuration files in a directory.

 <img width="551" height="110" alt="image" src="https://github.com/user-attachments/assets/19d59b5b-8645-4f0f-b2fd-b19c00c2cf45" />

Run the terraform plan command
 
Go ahead and run a plan to see that four new resources will be created (for a total of 24): two VPC endpoints, the security group and one ingress rule.

<img width="635" height="164" alt="image" src="https://github.com/user-attachments/assets/6fab6338-5c5d-42f9-ad1f-f2c438d6222d" />

Now, run terraform apply:

<img width="943" height="294" alt="image" src="https://github.com/user-attachments/assets/c67de641-817e-4ffb-bc7e-b81af423d16c" />
<img width="650" height="114" alt="image" src="https://github.com/user-attachments/assets/556ca54a-1187-4633-81cd-b5cc2f704f2c" />

<h1>Conclusion</h1>
We’re well on our way to completing this project now that we have our VPC endpoints for SSM. Our next step is to create our EC2 instance module, so go ahead and complete this lab and I’ll see you in the next lesson







