require_relative './spec_helper'

describe Transaction do

  let(:transaction) { Transaction }
  it 'withdraw returns a hash with corresponding values' do
    withdrawal = transaction.withdraw(500, balance = 0)
    expect(withdrawal.date).to eq(Transaction::DATE_FORMAT)
    expect(withdrawal.value).to eq -500
    expect(withdrawal.credit).to eq nil
    expect(withdrawal.debit).to eq 500
    expect(withdrawal.balance_before_transaction).to eq 0
    expect(withdrawal.balance_after_transaction).to eq -500
  end

  it 'deposit returns a hash with corresponding values' do
    deposit = transaction.deposit(500, balance = 0)
    expect(deposit.date).to eq(Transaction::DATE_FORMAT)
    expect(deposit.value).to eq 500
    expect(deposit.credit).to eq 500
    expect(deposit.debit).to eq nil
    expect(deposit.balance_before_transaction).to eq 0
    expect(deposit.balance_after_transaction).to eq 500
  end

end