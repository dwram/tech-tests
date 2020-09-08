# Handles statement output to User
class Printer

  @beginning_balance = 0
  @after_transaction = 0

  def self.print(statement, balance)
    @current_balance = balance
    puts 'DATE || CREDIT || DEBIT || BALANCE'
    statement.sort.reverse.to_h.map do |_, transaction|
      statement_output(transaction, balance)
    end
  end

  private

  def self.statement_output(transaction, balance)
    credit = '%.2f' % transaction[0].credit if transaction[0].credit
    debit = '%.2f' % transaction[0].debit if transaction[0].debit
    @persisted_transaction_value = (@beginning_balance + transaction[0].value)
    @current_balance += -@persisted_transaction_value
    puts "#{transaction[0].date} || #{credit} || #{debit} || #{'%.2f' % (@current_balance + transaction[0].value) } "
  end

end
