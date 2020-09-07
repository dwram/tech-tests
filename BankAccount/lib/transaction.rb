# Handles the transactions of bank account
class Transaction
  attr_reader :date, :credit, :debit, :value, :balance_after_transaction, :balance_before_transaction
  DATE_FORMAT = Time.now.strftime('%d/%m/%Y')

  def initialize(type, credit: nil, debit: nil, value:, balance:)
    @date = DATE_FORMAT
    @credit = credit
    @debit = debit
    @value = value
    @balance_before_transaction = balance
    @balance_after_transaction = balance + value
  end

  def self.withdraw(amount, balance)
    Transaction.new('withdraw', credit: nil, debit: amount, value: -amount, balance: balance)
  end

  def self.deposit(amount, balance)
    Transaction.new('deposit', credit: amount, debit: nil, value: amount, balance: balance)
  end

end

