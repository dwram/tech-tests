# Handles statement output to User
class Printer

  def self.print(statement)
    puts 'DATE || CREDIT || DEBIT || BALANCE'
    statement.sort.reverse.to_h.map do |_, transaction|
      statement_output(transaction)
    end
  end

  private

  def self.statement_output(transaction)
    credit = '%.2f' % transaction[0].credit if transaction[0].credit
    debit = '%.2f' % transaction[0].debit if transaction[0].debit
    puts "#{transaction[0].date} || #{credit} || #{debit} || #{'%.2f' % transaction[0].balance_after_transaction}"
  end

end
