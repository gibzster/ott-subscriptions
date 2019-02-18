**Subscriptions**
----
  _An api for managing customer subscriptions._

* **URL**

  _/subscriptions_
  
  GET` | `POST` | `DELETE` | `PUT`

* **GET:**
  
  **URL Params**
        
        `page: Page number to display. Defaults to 1. 25 displayed per page.`
   
* **POST:**
  
  **URL Params**
  
       `product_name:string`  
       `email: string`  
       `city: string`  
       `state:string`  
       `country:string`  
       `billing_type:string`  
       `plaform:string` 
       `subscribed_at:date`
       
* **POST:**

  **/{subscription_id}/**
  **URL Params**
  
       `product_name:string`  
       `email: string`  
       `city: string`  
       `state:string`  
       `country:string`  
       `billing_type:string`  
       `plaform:string` 
       `subscribed_at:date`

* **DELETE:**

  **/{subscription_id}/**
  **URL Params**             
        
      
   

