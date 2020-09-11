require 'spec_helper'

describe DatabaseConnection do

  it 'can connect to database' do
    first_connection = DatabaseConnection.connect
    expect(first_connection).to be_truthy
  end

  it 'shares the same memoized connection' do
    first_connection = DatabaseConnection.connect
    second_connection = DatabaseConnection.connect
    expect(first_connection).to eq(second_connection)
  end

end

