Rails Portfolio Project

Because this app  can be used to keep a record of a business's inventory, I opted to adapt the login process to stengthen my app's security. While multiple User instances may  be created, only the 'employee initials' and password' 'attributes will to vary from the User.first instances' values; a user will have to enter a predefined password (for now it is 'employee') and the store_id entered by User.first to gain access to the app or be validated through OmniAuth-google which goes through User.first's email account. An email or text confirmation will be sent to User.first upon signing up and the form to persit the notes from each interaction, which is a step required to log out, will require an employee's initials (employeeInit) to distinguish between interactions. A separate email detailing account activies will be sent to User.first upon logout.  The app begins as an empty store; after running db:seed to establish manufacturers, aisles, and occasion categories,just begin adding inventory. Note: The very first time, you have to log out and officially sign-in to be authorized to additional users.  

A Gmail account with two step verification and an Gmail provided APP password may be required so that Gmail doesn't consider app 'status reports' to be spam.

Google Authenticate is working on  http://127.0.0.1:3000
