require_relative('../../db/sql_runner.rb')

class Campaign

  attr_reader :id
  attr_accessor :campaign_name

  def initialize(options)
      @id = options['id'].to_i if options['id']
      @campaign_name = options['campaign_name']
  end

  def save()
    sql = "INSERT INTO campaigns
    (
      campaign_name
      ) VALUES (
        $1
        )
        RETURNING id;"
      values = [@campaign_name]
      results = SqlRunner(sql, values).first
      @id = results['id'].to_i
  end

  def update()
    sql = "UPDATE campaigns
    SET (
      campaign_name
      ) = (
        $1
        )
        WHERE id = $2;"
    values = [@campaign_name, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM campaigns;"
    campaigns = SqlRunner.run(sql)
    result = Campaign.map_item(campaigns)
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM campaigns
    WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Campaign.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM campaigns;"
    SqlRunner.run(sql)
  end

  def self.destroy( id )
    sql = "DELETE FROM campaigns
    WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end


  def self.map_item(data_source)
    result = data_source.map { |campaign| Campaign.new(campaign)}
    return result
  end


end
