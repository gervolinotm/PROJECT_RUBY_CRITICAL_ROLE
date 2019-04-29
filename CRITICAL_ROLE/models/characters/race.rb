require_relative('../../db/sql_runner.rb')

class Race

  attr_reader :id
  attr_accessor :race

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @race = options['race']
  end

  def save()
    sql = "INSERT INTO races
    (
      race
      ) VALUES (
        $1
        )
        RETURNING id;"
    values = [@race]
    results = SqlRunner.run(sql, values).first
    @id = results['id'].to_i
  end

  def update()
    sql = "UPDATE races SET
    (
      race
      ) = (
        $1
        )
       WHERE id = $2;"
       values = [@race, @id]
    SqlRunner(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM races;"
    races = SqlRunner.run(sql)
    result = Race.map_item(races)
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM races
    WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Race.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM races;"
    SqlRunner.run(sql)
  end

  def self.destroy( id )
    sql = "DELETE FROM races
    WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end


  def self.map_item(data_source)
    result = data_source.map { |race| Race.new(race)}
    return result
  end



end
