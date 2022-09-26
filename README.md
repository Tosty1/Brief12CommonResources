# buying a domain name

![1.png](https://raw.githubusercontent.com/P20CloudAzure/Brief12CommonResources/Sendgrid/images/1.png)

# creating the app service domain

![2.png](../images/2.png)

# then full all of the important informations

![3.png](../images/3.png)

##### and then create the app service domain

##### after creating the domain it will show us this page so we have to click on manage DNS records

![5.png](../images/5.png)

##### after that it will show us the folwing page so we have to click on Record set

![6.png](../images/6.png)

##### and to use this we have to link it with another service called **Twilio SendGrid** you can find it in azure marketplace

![7.png](../images/7.png)

### then go to the resource group and open SaaS Account on publisher’s site and connect with your azure acount to show sendgrid page

![8.png](../images/8.png)

#### go to the settind

![9.png](../images/9.png)

### and then choose Sender Authentication

![10.png](../images/10.png)

### choose then authenticate Your Domain

![11.png](../images/11.png)

### for the DNS host select other host

### and for which DNS host put "appdomainservice"

#### after that it will show for us the following page so what we have to do is to copy all of the host and values and put it in the appservicedomain 

![12.png](../images/12.png)

### clicl on Record set and then copy the host from sendgrid in the name box in the type you have to choose CNAME in the ALIAS box put the value of the sendgrid sender authentication repeat this three times with all of the host and the values and then click ok and that's it

![13.png](../images/13.png)
