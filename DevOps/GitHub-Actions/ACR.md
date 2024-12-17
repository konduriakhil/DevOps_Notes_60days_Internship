ACR Integration
-----------------
## Requirements
* [Ref here](https://github.com/marketplace/actions/azure-container-registry-login) for market place of acr login
![alt text](images/acr1.png)
* Create the ACR (Azure Container Registry) in the Azure Account
![alt text](images/acr2.png)
![alt text](images/acr3.png)
* Add the credentials as secrets as mentioned below
    1. login url 
    2. username
    3. password
![alt text](images/acr4.png)
![alt text](images/acr5.png)
![alt text](images/acr6.png)
![alt text](images/acr7.png)
![alt text](images/acr8.png)
![alt text](images/acr9.png)
![alt text](images/acr10.png)
![alt text](images/acr11.png)
![alt text](images/acr12.png)
![alt text](images/acr13.png)
![alt text](images/acr14.png)
![alt text](images/acr15.png)
![alt text](images/acr16.png)
![alt text](images/acr17.png)
![alt text](images/acr18.png)
![alt text](images/acr19.png)
* Use the following syntax for calling the variables `${{ vars.<variable_name>}}`, `${{ secrets.<secret_name> }}`
![alt text](images/acr20.png)
![alt text](images/acr21.png)
![alt text](images/acr22.png)
![alt text](images/acr23.png)
* See that whether images are pushed into the repository or not.
![alt text](images/acr24.png)