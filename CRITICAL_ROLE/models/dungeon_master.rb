class DungeonMaster

  attr_reader :id
  attr_accessor :dm_name, :campaign, :level_req

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @dm_name = options['dm_name']
    @campaign = options['campaign']
    @level_req = options['level_req'].to_i
  end

end
