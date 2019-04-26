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

end
