### Setup

1. run `bundle install` to install the dependencies
2. run `rake -T` to view your list of available rake tasks

---

If working off master, you'll need to create your migrations.
1. run `rake db:create_migration NAME=users`
2. run `rake db:create_migration NAME=drivers`
3. run `rake db:create_migration NAME=rides`

Once your migration are complete, execute the migration by running `rake db:migrate`. Next, generate some seed data with `rake db:seed`. Finally, run `rake console` to access your database and mess around with Active Record. Try typing `User.all` to view all the users in the users table. To view all drivers of a specific user, try:
```ruby
user = User.find_by_id(10)
user.drivers.all
```

---

If working off without-active-record, you'll need to do a few things manually. First go into the ruby console to access your database by running `rake console`. Next, create your tables:
1. `User.create_table`
2. `Driver.create_table`
3. `Ride.create_table`

Next, generate some data by running `rake seed`
To access the database and classes, run `rake console`

Play around with some of the available methods and see if you can create your own!

Play around with some of the available methods and see if you can create your own!