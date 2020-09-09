require_relative './spec_helper'

=begin
class FakeTransaction < Transaction
  def initialize(date: Time.now, credit: nil, debit: nil, value:)
    @date = date.strftime('%d/%m/%Y')
    @credit = credit
    @debit = debit
    @value = value
  end
end
=end

describe Printer do

  #let(:deposit) { instance_double(Transaction,value: 100, credit: 100, debit: nil, date: ((Time.now - 99999).strftime('%d/%m/%Y'))) }
  #let(:withdraw) { instance_double(Transaction,value: -200, credit: nil, debit: 200, date: ((Time.now).strftime('%d/%m/%Y'))) }
  #let(:transaction_deposit) { class_double(Transaction, withdraw: deposit) }
  #let(:transaction_withdraw) { class_double(Transaction, withdraw: withdraw)}
  # transaction_one = FakeTransaction.new(credit: 100, value: 100)
  # transaction_two = FakeTransaction.new(date: Time.now + 999999, debit: 100, value: -100)
  #
  it 'prints newest first' do
    deposit = instance_double(Transaction,value: 100, credit: 100, debit: nil, date: ((Time.now - 99999).strftime('%d/%m/%Y')))
    withdraw = instance_double(Transaction,value: -100, credit: nil, debit: 100, date: ((Time.now).strftime('%d/%m/%Y')))

    statement = {
      1 => [deposit],
      2 => [withdraw]
    }
    p Printer.print(statement, 0)

  end
end
