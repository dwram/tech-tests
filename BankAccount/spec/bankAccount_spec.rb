require_relative './spec_helper'

describe BankAccount do
  let(:account) { BankAccount }

  it 'starts with an empty account' do
    expect(account.balance).to eq 0
  end

  it 'can deposit an amount (100)' do
    account.make_transaction('deposit', 100)
    expect(account.balance).to eq 100
  end

  it 'can withdraw an amount (100)' do
    account.make_transaction('withdraw', 200)
    expect(account.balance).to eq -100
  end

  it 'can deposit again 400' do
    account.make_transaction('deposit', 400)
    expect(account.balance).to eq 300
  end

  it 'has statements storing transactions for deposit/withdraw' do
    expect(account.print_statement.size).to eq 3
  end

end