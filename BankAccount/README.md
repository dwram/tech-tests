<h3>Bank Account application</h3> 

<img src="https://i.gyazo.com/99825ea9ef97363bbe820b6977210ec6.png" alt="Bank Account Image"/>

<h5>Runs in IRB/Pry. <br/> Require the file in the shell environment.</h5>


**To begin:**
- At project root execute `bundle install`
- At tech_test root `SHELL -r './BankAccount/lib/bankAccount.rb'`
- At project root `SHELL -r '/lib/bankAccount.rb'` or `'irb -I './lib' `

**To run tests:**
- Execute command `rspec`

**Acceptance criteria**

- Given a client makes a deposit of 1000 on 10-01-2012
- And a deposit of 2000 on 13-01-2012
- And a withdrawal of 500 on 14-01-2012
- When she prints her bank statement
Then she would see<br/>
```
date || credit || debit || balance
 
 14/01/2012 || || 500.00 || 2500.00
 
 13/01/2012 || 2000.00 || || 3000.00
 
 10/01/2012 || 1000.00 || || 1000.00
 ```

My approach and methodology (copied and pasted)

```CLI operable
 Transaction types: Deposit/Withdrawl
 Each transaction will have a date, amount and balance (showing current balance in bank account)
 (Non-persisted) Store of information in RAM
 
 Method to print her bank statement with table syntax DATE || CREDIT || DEBIT || BALANCE
 Credit = Deposit (Bank takes from User)
 Debit = Withdrawal (User takes from bank)
```
 
For more information: https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md


