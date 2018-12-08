require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :funds, :name

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds)
    VALUES ($1, $2)
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def self.all
    sql = "SELECT * from customers"
    customer_data = SqlRunner.run(sql)
    return customer_data.map{ |customer| Customer.new(customer)}
  end

end
