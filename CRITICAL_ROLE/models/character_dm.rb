require_relative('../db/sql_runner.rb')

class CharacterDM

  attr_reader :id
  attr_accessor :dm_id, :character_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @dm_id = options['dm_id'].to_i
    @character_id = optiond['character_id'].to_i
  end


end
