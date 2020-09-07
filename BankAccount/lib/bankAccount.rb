# frozen_string_literal: true

require_relative './transaction'

# Central "orchestrator" for the bank account
class BankAccount
  attr_reader :balance, :statements, :transaction_id

  @transaction_id = 1
  @balance = 0
  @statements = Hash.new { |key, value| key[value] = [] }

  class << self
    attr_reader :balance
  end

  def self.transaction(transaction_class = Transaction, type, amount)
    new_transaction = (type.match(/deposit/i) ? transaction_class.deposit(amount, @balance) : transaction_class.withdraw(amount, @balance))
    @balance += new_transaction.value
    add_to_statement(new_transaction)
  end

  def self.add_to_statement(new_transaction)
    @statements[@transaction_id] << new_transaction
    increment_transaction_id
  end

  def self.print_statement
    puts 'DATE || CREDIT || DEBIT || BALANCE'
    @statements.sort.reverse.to_h.map do |_, transaction|
      puts "#{transaction[0].date} || #{transaction[0].credit} || #{transaction[0].debit} ||
      #{transaction[0].balance_after_transaction}"
    end
  end

  def self.increment_transaction_id
    @transaction_id += 1
  end
end
