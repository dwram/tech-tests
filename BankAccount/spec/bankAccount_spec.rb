require_relative './spec_helper'

describe BankAccount do
  let(:account) { BankAccount }

  it 'starts with an empty account' do
    expect(account.balance).to eq 0
  end

  it 'can deposit an amount (100)' do
    deposit = instance_double(Transaction,value: 100, credit: 100, debit: nil, date: ((Time.now - 99999).strftime('%d/%m/%Y')))
    transaction = class_double(Transaction, deposit: deposit)
    account.make_transaction(transaction, 'deposit', 100)
    expect(account.balance).to eq 100
  end

  it 'can withdraw an amount (100)' do
    withdraw = instance_double(Transaction,value: -200, credit: nil, debit: 200, date: ((Time.now).strftime('%d/%m/%Y')))
    transaction_two = class_double(Transaction, withdraw: withdraw)
    account.make_transaction(transaction_two,'withdraw', 200)
    expect(account.balance).to eq -100
  end

  it 'can deposit again 400' do
    deposit = instance_double(Transaction,value: 400, credit: 400, debit: nil, date: ((Time.now + 99999).strftime('%d/%m/%Y')))
    transaction_three = class_double(Transaction, deposit: deposit)
    account.make_transaction(transaction_three,'deposit', 400)
    expect(account.balance).to eq 300
  end

  it 'has statements storing transactions for deposit/withdraw' do
    printer = class_double(Printer, print: account.statements)
    expect(account.print_statement(printer).size).to eq 3
  end

end