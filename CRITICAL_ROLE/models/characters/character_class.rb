require_relative('../../db/sql_runner.rb')

class CharacterClass

  attr_reader :id
  attr_accessor :class_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @class_name = options['class_name']
  end

  def save()
    sql = "INSERT INTO character_classes
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

  def update()
    sql = "UPDATE character_classes
    SET (
        class_name
      ) = (
        $1
        )
        WHERE id = $2;"
    values = [@class_name, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM character_classes;"
    classes = SqlRunner.run(sql)
    result = Character.map_item(classes)
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM character_classes
    WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return CharacterClass.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM character_classes;"
    SqlRunner.run(sql)
  end

  def self.destroy( id )
    sql = "DELETE FROM character_classes
    WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.map_item(data_source)
    result = data_source.map { |x| CharacterClass.new(x)}
    return result
  end


end
