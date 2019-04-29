require_relative('../../db/sql_runner.rb')
require_relative('../dungeon_masters/dungeon_master.rb')
require_relative('./player.rb')
require_relative('./race.rb')
require_relative('./character_class.rb')

class Character

  attr_reader :id, :player_id, :race_id, :character_class_id
  attr_accessor :character_name, :level

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @player_id = options['player_id'].to_i
    @character_name = options['character_name']
    @race_id = options['race_id'].to_i
    @character_class_id = options['character_class_id'].to_i
    @level = options['level'].to_i
  end

  def save()
    sql = "INSERT INTO characters
    (
      player_id,
      character_name,
      race_id,
      character_class_id,
      level
      ) VALUES (
        $1, $2, $3, $4, $5
        )
        RETURNING id;"
    values = [@player_id, @character_name, @race_id, @character_class_id, @level]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def update()
    sql = "UPDATE characters
    SET (
      player_id,
      character_name,
      race_id,
      character_class_id,
      level
      ) = (
        $1, $2, $3, $4, $5
        )
        WHERE id = $6;"
    values = [@player_id, @character_name, @race_id, @character_class_id, @level, @id]
    SqlRunner.run(sql, values)
  end

  def race()
    race = Race.find(@race_id)
    return race
  end

  def player_name()
    player = Player.find(@player_id)
    return player.format_name
  end

  def character_class()
    class_name = CharacterClass.find(@character_class_id)
    return class_name
  end

  def self.all()
    sql = "SELECT * FROM characters;"
    characters = SqlRunner.run(sql)
    result = Character.map_item(characters)
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM characters
    WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Character.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM characters;"
    SqlRunner.run(sql)
  end

  def self.destroy( id )
    sql = "DELETE FROM characters
    WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.map_item(data_source)
    result = data_source.map { |character| Character.new(character)}
    return result
  end


end
