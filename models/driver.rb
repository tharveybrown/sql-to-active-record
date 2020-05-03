class Driver 
  attr_accessor :user_id, :driver_id, :distance, :cost, :id
    
  def initialize(driver, id=nil)
    @name = driver["name"]
    @rating = driver["rating"]
    @id = driver["id"]
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
end