class Character

  attr_reader :id, :dm_id
  attr_accessor :player_name, :character_name, :class, :race, :level

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @player_name = options['player_name']
    @character_name = options['character_name']
    @class = options['class']
    @race = options['race']
    @level = options['level'].to_i
    @dm_id = options['dm_id'].to_i
  end
  


end
