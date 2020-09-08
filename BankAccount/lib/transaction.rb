# Handles the transactions of bank account
class Transaction
  attr_reader :date, :credit, :debit, :value
  DATE_FORMAT = Time.now.strftime('%d/%m/%Y')

  def initialize(credit: nil, debit: nil, value:)
    @date = DATE_FORMAT
    @credit = credit
    @debit = debit
    @value = value
  end

  def self.withdraw(amount, balance)
    Transaction.new(credit: nil, debit: amount, value: -amount)
  end

  def self.deposit(amount, balance)
    Transaction.new(credit: amount, debit: nil, value: amount)
  end

end

