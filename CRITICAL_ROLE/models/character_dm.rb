require_relative('../db/sql_runner.rb')

class CharacterDM

  attr_reader :id
  attr_accessor :dm_id, :character_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @dm_id = options['dm_id'].to_i
    @character_id = optiond['character_id'].to_i
  end

  def save()
    sql = "INSERT INTO character_dms
    (
      dm_id,
      character_id
      ) VALUES (
        $1, $2
        )
        RETURING id;"
    values = [@dm_id, @character_id]
    results = SqlRunner.run(sql, values).first
    @id = results['id'].to_i
  end

  def update()
    sql = "UPDATE character_dms
    SET (
      dm_id,
      character_id
      ) = (
        $1, $2
        )
        WHERE id = $3;"
    values = [@dm_id, @character_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM character_dms;"
    dms = SqlRunner.run(sql)
    result = CharacterDM.map_item(dms)
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM character_dms
    WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return CharacterDM.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM character_dms;"
    SqlRunner.run(sql)
  end

  def self.destroy( id )
    sql = "DELETE FROM character_dms
    WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.map_item(data_source)
    result = data_source.map { |dm| CharacterDM.new(dm)}
    return result
  end

end
