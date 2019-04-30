require_relative('../../db/sql_runner.rb')

class DungeonMaster

  attr_reader :id, :campaign_id
  attr_accessor :dm_name, :min_level, :max_level

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @dm_name = options['dm_name'].capitalize
    @campaign_id = options['campaign_id'].to_i
    @min_level = options['min_level'].to_i
    @max_level = options['max_level'].to_i
  end

  def save()
    sql = "INSERT INTO dungeon_masters
    (
      dm_name,
      campaign_id,
      min_level,
      max_level
      ) VALUES (
        $1, $2, $3, $4
        )
        RETURNING id;"
    values = [@dm_name, @campaign_id, @min_level, @max_level]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def update()
    sql = "UPDATE dungeon_masters
    SET (
      dm_name,
      campaign_id,
      min_level,
      max_level
    ) = (
      $1, $2, $3, $4
    )
    WHERE id = $5;
    "
    values = [@dm_name, @campaign_id, @min_level, @max_level, @id]
    SqlRunner.run(sql, values)
  end

  def campaign()
    campaign_name = Campaign.find(@campaign_id)
    return campaign_name
  end

  def characters_in_campaign()
    sql = "SELECT * FROM characters
    INNER JOIN character_dms
    ON characters.id = character_dms.character_id
    WHERE character_dms.dm_id = $1;"
    values = [@id]
    characters = SqlRunner.run(sql, values)
    results = Character.map_item(characters)
    return results
  end

  def self.all()
    sql = "SELECT * FROM dungeon_masters;"
    dms = SqlRunner.run(sql)
    result = DungeonMaster.map_item(dms)
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM dungeon_masters
    WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return DungeonMaster.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM dungeon_masters;"
    SqlRunner.run(sql)
  end

  def self.destroy( id )
    sql = "DELETE FROM dungeon_masters
    WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.map_item(data_source)
    result = data_source.map { |dm| DungeonMaster.new(dm)}
    return result
  end

end
