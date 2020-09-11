require_relative './spec_helper'

describe Printer do

  it 'prints newest first' do
    deposit = instance_double(Transaction,value: 100, credit: 100, debit: nil, date: ((Time.now - 99999).strftime('%d/%m/%Y')))
    withdraw = instance_double(Transaction,value: -100, credit: nil, debit: 100, date: ((Time.now).strftime('%d/%m/%Y')))
    statement = {
      1 => [deposit],
      2 => [withdraw]
    }
    output_statement = Printer.print(statement, 0)
    expect(output_statement.first).to eq('11/09/2020 ||  || 100.00 || 0.00')
    expect(output_statement[1]).to eq('10/09/2020 || 100.00 ||  || 100.00')
  end
end
