require_relative('../../db/sql_runner.rb')

class Player

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO players
    (
      first_name,
      last_name
      ) VALUES (
        $1, $2
        )
        RETURNING id;"
    values = [@first_name, @last_name]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def update()
    sql = "UPDATE players SET
    (
      first_name,
      last_name
    ) = (
      $1, $2
      )
      WHERE id = $3;"
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end


end
