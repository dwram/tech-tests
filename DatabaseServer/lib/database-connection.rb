require 'pg'

class DatabaseConnection

  def self.connect
    @database ||= PG::Connection.open(dbname: 'DatabaseServer', user: 'postgres', password: '')
  end

end

