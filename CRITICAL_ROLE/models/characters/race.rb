require_relative('../../db/sql_runner.rb')

class Race

  attr_reader :id
  attr_accessor :race

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @race = options['race']
  end


end
