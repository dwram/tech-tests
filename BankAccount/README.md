<h3>Bank Account application</h3> 

<img src="https://i.gyazo.com/afe9524b5281e8c7234243f4f9bc3c59.png">

Runs in IRB/Pry.

**To begin**
At project root execute `bundle install`

**To run tests**
Execute command `rspec`

**Acceptance criteria**

- Given a client makes a deposit of 1000 on 10-01-2012
- And a deposit of 2000 on 13-01-2012
- And a withdrawal of 500 on 14-01-2012
- When she prints her bank statement
- Then she would see<br/>
```
date || credit || debit || balance
 
 14/01/2012 || || 500.00 || 2500.00
 
 13/01/2012 || 2000.00 || || 3000.00
 
 10/01/2012 || 1000.00 || || 1000.00
 ```
 
For more information: https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md


