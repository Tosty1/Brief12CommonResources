# buying a domain name

![1.png](https://raw.githubusercontent.com/P20CloudAzure/Brief12CommonResources/Sendgrid/images/1.png)

# creating the app service domain

![2.png](https://raw.githubusercontent.com/P20CloudAzure/Brief12CommonResources/Sendgrid/images/2.png)

# then full all of the important informations

![3.png](https://raw.githubusercontent.com/P20CloudAzure/Brief12CommonResources/Sendgrid/images/2.png)

##### and then create the app service domain

![4.png](https://github.com/P20CloudAzure/Brief12CommonResources/blob/Sendgrid/images/4.png?raw=true)

##### after creating the domain it will show us this page so we have to click on manage DNS records

![5.png](https://raw.githubusercontent.com/P20CloudAzure/Brief12CommonResources/Sendgrid/images/5.png)

##### after that it will show us the folwing page so we have to click on Record set

![6.png](https://github.com/P20CloudAzure/Brief12CommonResources/blob/Sendgrid/images/6.png?raw=true)

##### and to use this we have to link it with another service called **Twilio SendGrid** you can find it in azure marketplace

![7.png](https://github.com/P20CloudAzure/Brief12CommonResources/blob/Sendgrid/images/7.png?raw=true)

### then go to the resource group and open SaaS Account on publisher’s site and connect with your azure acount to show sendgrid page

![8.png](https://github.com/P20CloudAzure/Brief12CommonResources/blob/Sendgrid/images/8.png?raw=true)

#### go to the settind

![9.png](https://github.com/P20CloudAzure/Brief12CommonResources/blob/Sendgrid/images/9.png?raw=true)

### and then choose Sender Authentication

![10.png](https://github.com/P20CloudAzure/Brief12CommonResources/blob/Sendgrid/images/10.png?raw=true)

### choose then authenticate Your Domain

![11.png](https://github.com/P20CloudAzure/Brief12CommonResources/blob/Sendgrid/images/11.png?raw=true)

### for the DNS host select other host

### and for which DNS host put "appdomainservice"

#### after that it will show for us the following page so what we have to do is to copy all of the host and values and put it in the appservicedomain 

![12.png](https://github.com/P20CloudAzure/Brief12CommonResources/blob/Sendgrid/images/12.png?raw=true)

### clicl on Record set and then copy the host from sendgrid in the name box in the type you have to choose CNAME in the ALIAS box put the value of the sendgrid sender authentication repeat this three times with all of the host and the values and then click ok and that's it

![13.png](https://github.com/P20CloudAzure/Brief12CommonResources/blob/Sendgrid/images/13.png?raw=true)
