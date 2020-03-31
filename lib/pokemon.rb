require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize (id: id, name: name, type: type, db: db)
    @id = id
    @name = name 
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?,?)
    SQL
    db.execute(sql, name, type)
  end
  
  def self.find(id, db)
    sql = <<-SQL
    SELECT * FROM pokemon
    SQL
    a = id - 1
    b = db.execute(sql)
    z = b[a]
    self.new_from_db(z)
  end
  
  def self.new_from_db(array)
    new_poke = self.new
    new_poke.id = array[0]
    new_poke.name = array[1]
    new_poke.type = array[2]
    new_poke.db = @db
    new_poke
  end
  
  
end
