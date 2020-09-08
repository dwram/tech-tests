# frozen_string_literal: true
require_relative './transaction'
require_relative './printer'

# Central "orchestrator" for the bank account
class BankAccount
  attr_reader :balance, :statements, :transaction_id

  @transaction_id = 1
  @balance = 0
  @statements = Hash.new { |key, value| key[value] = [] }

  class << self
    attr_reader :balance
  end

  def self.make_transaction(transaction_class = Transaction, type, amount)
    new_transaction = (type.match(/deposit/i) ? transaction_class.deposit(amount, @balance) : transaction_class.withdraw(amount, @balance))
    increase_balance(new_transaction.value)
    add_to_statement(new_transaction)
  end

  def self.add_to_statement(new_transaction)
    @statements[@transaction_id] << new_transaction
    increment_transaction_id
  end

  def self.print_statement(printer_class = Printer)
    printer_class.print(@statements, @balance)
  end

  private

  def self.increment_transaction_id
    @transaction_id += 1
  end

  def self.increase_balance(value)
    @balance += value
  end

end
