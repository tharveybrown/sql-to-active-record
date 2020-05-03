class Ride 
  attr_accessor :user_id, :driver_id, :distance, :cost, :id
    
  def initialize(ride, id=nil)
    @user_id = ride["user_id"]
    @driver_id = ride["driver_id"]
    @distance = ride["distance"]
    @cost = ride["cost"]
    @id = ride["id"]
  end

  def self.create_table
    sql =  <<-SQL 
      CREATE TABLE IF NOT EXISTS rides (
        id INTEGER PRIMARY KEY, 
        user_id INTEGER, 
        driver_id INTEGER,
        distance FLOAT,
        cost FLOAT
        )
        SQL
    CONN.execute(sql) 
  end

  def self.create(attributes)
    ride = self.new(attributes)
    ride.save
  end

  def save
    if self.id
      self.update
    else
      sql = "INSERT INTO rides (user_id, driver_id, distance, cost) VALUES (?,?,?,?)"
      CONN.execute(sql, self.user_id, self.driver_id, self.distance, self.cost)
      self.id = CONN.execute("SELECT last_insert_rowid() FROM rides")[0][0]
    end
    self
  end

  def self.find_by_id(id)
    ride = CONN.execute("SELECT * FROM artists WHERE id = ?", id)
    self.new(ride[0])
  end
end