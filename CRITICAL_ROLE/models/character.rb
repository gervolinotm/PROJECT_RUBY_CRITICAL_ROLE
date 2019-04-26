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



end
