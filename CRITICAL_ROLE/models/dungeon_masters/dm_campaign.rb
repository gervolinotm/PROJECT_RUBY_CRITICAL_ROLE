require_relative('../../db/sql_runner.rb')

class DMCampaign

  attr_reader :id
  attr_accessor :dm_id, :campaign_id, :min_level, :max_level

  def initialize(options)
    @id = options['id'].to_i id options['id']
    @dm_id = options['dm_id'].to_i
    @campaign_id = options['campaign_id'].to_i
    @min_level = options['min_level'].to_i
    @max_level = options['max_level'].to_i
  end

  def save()
    sql = "INSERT INTO dm_campaigns
    (
      dm_id,
      campaign_id,
      min_level,
      max_level
      ) VALUES (
        $1, $2, $3, $4
        )
        RETURNING id;"
      values = [@dm_id, @campaign_id, @min_level, @max_level]
      results = SqlRunner.run(sql, values).first
      @id = results['id'].to_i
  end

  def update()
    sql = "UPDATE dm_campaigns
    SET (
      dm_id,
      campaign_id,
      min_level,
      max_level
      ) = (
        $1, $2, $3, $4
        )
        WHERE id = $5;"
  end


end
