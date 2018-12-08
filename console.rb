require_relative("models/customer")
require_relative("models/film")
require_relative("models/ticket")

require('pry')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({
  'name' => 'Jodie Tennant',
  'funds' => 100
  })

customer1.save

customer2 = Customer.new({
  'name' => 'Joe McColl',
  'funds' => 50
  })

customer2.save

customer3 = Customer.new({
  'name' => 'Sam McColl',
  'funds' => 100
  })

customer3.save

customer4 = Customer.new({
  'name' => 'Jade McLean',
  'funds' => 15
  })

customer4.save

customer5 = Customer.new({
  'name' => 'Steven Beurskens',
  'funds' => 200
  })

customer5.save

# customer5.name = 'Jock'
# customer5.update

# customer1.delete()

film1 = Film.new({
  'title' => 'Avengers 4: End Game',
  'price' => 10
  })

film1.save

film2 = Film.new({
  'title' => 'Fantastic Beasts 2: The crimes of Grindelwald',
  'price' => 10
    })

film2.save

film3 = Film.new({
  'title' => 'Creed II',
  'price' => 15
        })
film3.save

# film3.title = "Spiderman"
# film3.update
#
# film3.delete()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id})
ticket4 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id})
ticket5 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film3.id})

ticket1.save
ticket2.save
ticket3.save
ticket4.save
ticket5.save

# ticket1.customer_id = 333333333
# ticket1.update

# ticket1.delete()

binding.pry
nil
