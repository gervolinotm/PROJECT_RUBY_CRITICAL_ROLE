require_relative('../db/sql_runner.rb')

class CharacterClass

  attr_reader :class_name, :id

  def initialize(options)
    @class_name = options['class_name']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO classes
    (
      class_name
      ) VALUES (
        $1
        )
        RETURNING id;"
    values = [@class_name]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end





end
