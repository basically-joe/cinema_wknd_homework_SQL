require_relative("models/customer")
require_relative("models/film")
require_relative("models/tickets")

require('pry')

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

customer5.name = 'Jock'
customer5.update

customer5.save

binding.pry
nil
