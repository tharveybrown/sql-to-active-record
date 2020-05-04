class Driver 
  attr_accessor :rating, :id, :name
    
  def initialize(driver, id=nil)
    @name = driver[:name]
    @rating = driver[:rating]
    @id = driver[:id]
  end

  def self.create_table
    sql =  <<-SQL 
      CREATE TABLE IF NOT EXISTS drivers (
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        rating FLOAT
        )
        SQL
    CONN.execute(sql) 
  end

  def self.create(attributes)
    driver = self.new(attributes)
    driver.save
  end

  def save
    if self.id
      self.update
    else
      sql = "INSERT INTO drivers (name, rating) VALUES (?,?)"
      CONN.execute(sql, self.name, self.rating)
      self.id = CONN.execute("SELECT last_insert_rowid() FROM drivers")[0][0]
    end
    self
  end

  def self.find_by_id(id)
    driver = CONN.execute("SELECT * FROM artists WHERE id = ?", id)
    self.new(driver[0])
  end
    
  def update
    sql = <<-SQL
      UPDATE drivers
      SET name = ?, rating = ?
      WHERE id = ?
    SQL
    CONN.execute(sql, self.name, self.rating, self.id)
  end

  def self.all
    drivers = CONN.execute("SELECT * FROM drivers")
    drivers.each do |driver|
      Driver.new(driver)
    end
  end 

end