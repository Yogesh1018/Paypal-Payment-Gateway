Steps for sucessfully integration of paypal in website

Development -

1. Create a developer account of paypal through the given link
https://www.paypal.com/signin?returnUri=https%3A%2F%2Fdeveloper.paypal.com%2Fdeveloper%2Fapplications

2. Login in to the developer account you have created

3. choose account options inside the sandbox section on the sidebar

4. click on Create Account button to create an sandbox account

5. Fill in the necessary information and fill the amount you want in the paypal   account

6. Choose the Account Type as a Personal(Buyer Account)

7. create the account by clicking on creater account button

8. Create another account with the same procedure but choose Business(Merchant Account) as account type before create.

9. Go the accounts in the sandbox section(https://developer.paypal.com/developer/accounts/)

10. On the listed accounts click on the account you have created as business account type

11. Go the Profile < Api Credentials

12. Replace the login value inside paypal options in development.rb with Username of Api Credentials

13. Replace the password value inside paypal options in development.rb with Password of Api Credentials

14. Replace the signature value inside paypal options in development.rb with Signature of Api Credentials

15. Go to My Apps and credentials

16. Click on Create App

17. Create a new app with the merchant account selected as a sandbox business account.

18. Go to config/initializer/paypal.rb and replace the username, password, signature with the paypal options username, passsword, signature inside development.rb