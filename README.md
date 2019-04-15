# WikiMed
The goal of WikiMed is to create an open-source platform that allows people to get pricing estimates for different procedures at different facilities 
(hospitals, clinics, doctor's office, ect.). These pricing estimates are collected through others voluntarily entering their billing information in
the database. 

## Set-Up in Terminal
Install Rails  
    ```sudo gem install rails```  
Install Gems  
    ```bundle install```  
Migrate the Database  
    ```rake db:migrate```  

### Trouble Shooing
If this error is displayed:  
`Environment data not found in the schema.`

Enter this in the terminal:  
`bin/rails db:environment:set RAILS_ENV=development`  
`rake db:reset `   

## Thought Process
### Bills 
You will see on the landing page there are Quick Bills and Detailed Bills  
The Detailed Bill collects its price from the total of the Nested Items it has. This will be an issue later on due to rouning errors and if the individual 
entering the information does not fully submit everything on the bill.  
The Quick Bill has a singular nested Item, but the name and description are set to none. The Bill is recieving the total price directly from the 
individual inputting the information. 

### Security
Security will need to be re-evaluated at some point.  
We decided to not have users sign up to enter billing information so we are not storing email addresses with medical history attached. 

### Users
Admins are the only users currently. To make a new admin account, you will need to enter the following into the terminal:
    `User.create(email: \"a@a.com\", password: "asdasd", password_confirmation: "asdasd")`  
Admins do not have levels, though that might be a possibility in the future.   

## Admin Duties
Administrators are tasked with approving all bill entries and entering in new procedures and facilities.  
There is currently a mail-to link that general users can utilize to submit suggestions for new procedures and facilities.  
  
**Future**  
May want to have a csv export of all Facilities and Procedures so it can be maintained easier and be uploaded periodically. This will allow for mass
uploads and sorting through the data easier. 

## Items
Currently items are submitted as individual instances by the general user. This will cause the db to have multiple instances of the same item.  
*i.e Cotton Balls, Cotton ball, cotton ball, cotton*  
Items are set that they need all 3 fields filled in order to save the information. **This will need to be changed**. There is not currently an error 
message thrown when a bill/item is not saved, the application just loops back to `bill_new`.

**Future**  
Add Items as a table and have a drop-down menu. This will require a diverse input from the admin, but will reduce duplicates.  
**--or--**  
When displaying items, have a sound-like function and sort them through SQL while searching or processing the data. 

