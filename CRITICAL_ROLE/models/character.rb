require_relative('../db/sql_runner.rb')

class Character

  attr_reader :id, :dm_id
  attr_accessor :player_name, :character_name, :race, :character_class, :level

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @player_name = options['player_name']
    @character_name = options['character_name']
    @race = options['race']
    @character_class = options['character_class']
    @level = options['level'].to_i
    @dm_id = options['dm_id'].to_i
  end

  def save()
    sql = "INSERT INTO characters
    (
      player_name,
      character_name,
      race,
      character_class,
      level,
      dm_id
      ) VALUES (
        $1, $2, $3, $4, $5, $6
        )
        RETURNING id;"
    values = [@player_name, @character_name, @race, @character_class, @level, @dm_id]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM characters;"
    characters = SqlRunner.run(sql)
    result = Character.map_item(characters)
    return result
  end

  def self.map_item(data_source)
    result = data_source.map { |character| Character.new(character)}
    return result
  end


end
