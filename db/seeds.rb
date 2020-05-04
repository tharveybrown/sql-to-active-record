#Users table 
10.times do 
  User.create({
    name: Faker::FunnyName.three_word_name,
    address: Faker::Address.full_address,
    rating: 0
  })
end


#Drivers Table
10.times do 
  Driver.create({
     name: Faker::FunnyName.three_word_name,
     rating: 10
  })
end

#Rides Table

20.times do 
  Ride.create({user_id: User.all.sample.id, 
            driver_id: Driver.all.sample.id,
            cost: rand(100.00..1000.00),
            distance: rand(0.00..30.00)
            }
          )
end

#Users table 
10.times do 
  User.create({
    name: Faker::FunnyName.three_word_name,
    address: Faker::Address.full_address,
    rating: 0
  })
end



#Rides Table

20.times do 
  Ride.create({user_id: User.all.sample.id, 
            driver_id: Driver.all.sample.id,
            cost: rand(100.00..1000.00),
            distance: rand(0.00..30.00)
            }
          )
end