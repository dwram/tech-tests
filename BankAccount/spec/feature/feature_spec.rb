require_relative '../spec_helper'

describe BankAccount do

  context 'user journey' do

    let(:first_transaction_time) { '10-01-2012' }
    first_deposit = 1000
    let(:second_transaction_time) { '13-01-2012'}
    second_deposit = 2000
    let(:third_transaction_time) { '14-01-2012' }
    first_withdrawal = 500

    it 'with mocks showing functionality transaction chronology' do

      time = double(Time, now: first_transaction_time)
      deposit_transaction = instance_double(Transaction, date: time.now, credit: first_deposit, debit: nil, value: first_deposit)
      deposit_one = class_double(Transaction, deposit: deposit_transaction)
      BankAccount.make_transaction(deposit_one,'deposit', first_deposit)

      time = double(Time, now: second_transaction_time)
      deposit_transaction = instance_double(Transaction, date: time.now, credit: second_deposit, debit: nil, value: second_deposit)
      deposit_two = class_double(Transaction, deposit: deposit_transaction)
      BankAccount.make_transaction(deposit_two, 'deposit', second_deposit)

      time = double(Time, now: third_transaction_time)
      withdraw_transaction = instance_double(Transaction, date: time.now, credit: first_withdrawal, debit: nil, value: -first_withdrawal)
      withdraw_one = class_double(Transaction, withdraw: withdraw_transaction)
      BankAccount.make_transaction(withdraw_one, 'withdraw', first_withdrawal)

      statement = BankAccount.print_statement
      expect(statement.first).to eq('14-01-2012 || 500.00 ||  || 2500.00')
      expect(statement[1]).to eq('13-01-2012 || 2000.00 ||  || 3000.00')
      expect(statement.last).to eq('10-01-2012 || 1000.00 ||  || 1000.00')
    end

  end

end