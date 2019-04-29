require_relative('../../db/sql_runner.rb')

class Player

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO players
    (
      first_name,
      last_name
      ) VALUES (
        $1, $2
        )
        RETURNING id;"
    values = [@first_name, @last_name]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def update()
    sql = "UPDATE players
    SET (
      first_name,
      last_name
    ) = (
      $1, $2
      )
      WHERE id = $3;"
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def format_name()
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end

  def self.all()
    sql = "SELECT * FROM players;"
    players = SqlRunner.run(sql)
    result = Player.map_item(players)
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM players
    WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Player.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM players;"
    SqlRunner.run(sql)
  end

  def self.destroy( id )
    sql = "DELETE FROM players
    WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end


  def self.map_item(data_source)
    result = data_source.map { |player| Player.new(player)}
    return result
  end



end
