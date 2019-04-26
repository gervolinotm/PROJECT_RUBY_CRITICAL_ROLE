require_relative('../db/sql_runner.rb')

class DungeonMaster

  attr_reader :id
  attr_accessor :dm_name, :campaign, :level_req

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @dm_name = options['dm_name']
    @campaign = options['campaign']
    @level_req = options['level_req'].to_i
  end

  def save()
    sql = "INSERT INTO dungeon_masters
    (
      dm_name,
      campaign,
      level_req
      ) VALUES (
        $1, $2, $3
        )
        RETURNING id;"
    values = [@dm_name, @campaign, @level_req]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def update()
    sql = "UPDATE dungeon_masters
    SET (
      dm_name,
      campaign,
      level_req
    ) = (
      $1, $2, $3
    )
    WHERE id = $4;
    "
    values = [@dm_name, @campaign, @level_req, @id]
    SqlRunner.run(sql, values)
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
