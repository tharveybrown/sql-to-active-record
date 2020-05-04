require_relative '../config/environment.rb'
#Users table
User.create_table
users = [user_a = nil, user_b = nil, user_c = nil, user_d = nil, user_e = nil, user_f = nil, user_g = nil, user_e = nil, user_f = nil, user_h = nil, user_i = nil, user_j = nil]
n = 0
users.length.times do 
  
  users[n] = User.create({
    name: Faker::FunnyName.three_word_name,
    address: Faker::Address.full_address,
    rating: 0
  })
  n += 1
end


#Drivers Table
Driver.create_table
drivers = [driver_a = nil, driver_b = nil, driver_c = nil, driver_d = nil, driver_e = nil, driver_f = nil, driver_g = nil, driver_h = nil, driver_i = nil, driver_j = nil]
n = 0
drivers.length.times do 
  drivers[n] = Driver.create({
     name: Faker::FunnyName.three_word_name,
     rating: 10
  })
  n += 1
end

#Rides Table
Ride.create_table
n = 0
20.times do 
  
  Ride.create({user_id: User.all.sample["id"], 
            driver_id: Driver.all.sample["id"],
            cost: rand(100.00..1000.00),
            distance: rand(0.00..30.00)
            }
          )
  n += 1
end
# binding.pry

