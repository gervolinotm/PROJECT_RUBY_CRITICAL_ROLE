require_relative('../../db/sql_runner.rb')

class Campaign

  attr_reader :id
  attr_accessor :campaign_name

  def initialize(options)
      @id = options['id'].to_i if options['id']
      @campaign_name = options['campaign_name']
  end


end
