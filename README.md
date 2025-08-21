<h1>Deploying Interface VPC endpoints for SSM with Terraform</h1>

For this part of our project, we’re going to create two VPC endpoints for SSM: one for the SSM service and another for SSM messages. With these endpoints in place, our SSM interactions will be more secure since the traffic will be routed through AWS’s private network rather than the public internet.
To do this, we’re not going to create a new module because not everything needs to be one! Instead, we’ll add our VPC endpoints to our root main.tf file.

