Running Notes 
--------------
# Python
* Lamda service: turn off the computer, when you log out
* Serverless Service: no need of servers
* code is run as function
## ctl+H
  ### Editors
  * Find and replace
  ###  Browsers
  * Getting history
# Multi-Cloud
* scale_up/ scale_down --> vertical scalling
* scale_in/scale_out --> horizontal scalling
* `htop`
* ` stress-ng --cpu 8 --cpu-method all --timeout 60 --metrics-brief`


## AWS
* AWS don't stop  we have to stop and do scale_up/ scale_down
  * ### Scaling Policies
    * Simple/Step scaling
    * Target Tracking policy
    * Predictive scaling
      * it requires atleast two days of monitering
* `target group == auto scaling group`
* In interviews we have to say about `zero downtime deployment` policy
### Cloudformation
* In cloudformation stack is necessary
* Stack is like resource group in Azure
* 


## Azure
* Compute Gallery
* Azure stop and do scale_up/ scale_down
* Virtual machine scale sets = Auroscaling groups
* for predictive scaling it requiers atlaeast 2 days of time
* `Application health monitering` == `Amazon Cloud Watch`

### Azure Resource Manager (ARM) templates
* ref(https://learn.microsoft.com/en-us/azure/templates/)
* variables = local.tf(terraform)
* parameters = user inputs
* Content versionn is like tags which you  have to pass
* resource provider = for every service we have  different providers
* resource name = compute, network










* #### fixed scaling
  * give no of machines and those no of machines are maintained
* `Target Group` = `backend target`
* `rules` = `listeners`
* `health checks` == `health probes`
* #### load balacer
  * paths
  * headers
  * domains
* sticky sessions
  * these are in both applicaion lb and network lb
* `backend == virtual machine scale sets`
# terraform
* In interviews you have to say that I did terrascan and looking for any vulnerability issues.
## Terraform cloud
* when ever you are using git use tags section for terraform
* terrascan 
* terraform unit tests(It is not that much importance)
* terraform cloud
# Docker
* in `docker container run -d -P --name akhil ak:1`
  * In this docker is the command line tool
* 