class User
  attr_accessor :name, :address, :rating, :id
  
  def initialize(user, id=nil)
    @name = user[:name]
    @address = user[:address]
    @rating = user[:rating]
    @id = user[:id]
  end

  def self.create_table
    sql =  <<-SQL 
      CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        address TEXT,
        rating FLOAT
        )
        SQL
    CONN.execute(sql) 
  end

  def self.create(attributes)
    user = self.new(attributes)
    user.save
  end

  def save
    if self.id
      self.update
    else
      sql = "INSERT INTO users (name, address, rating) VALUES (?,?,?)"
      CONN.execute(sql, self.name, self.address, self.rating)
      self.id = CONN.execute("SELECT last_insert_rowid() FROM users")[0][0]
    end
    self
  end

  def self.find_by_id(id)
    user = CONN.execute("SELECT * FROM artists WHERE id = ?", id)
    self.new(user[0])
  end

  def update
    sql = <<-SQL
      UPDATE users
      SET name = ?, address = ?, rating = ?
      WHERE id = ?
    SQL
    CONN.execute(sql, self.name, self.address, self.rating, self.id)
  end


  def self.all
    users = CONN.execute("SELECT * FROM users")
    
    users.each do |user|
      User.new(user)
    end
  end
   
  def self.delete_table
    CONN.execute("DROP TABLE users")
  end

end