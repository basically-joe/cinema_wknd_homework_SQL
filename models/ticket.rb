require_relative("../db/sql_runner")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id)
    VALUES ($1, $2)
    RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values)[0];
    @id = ticket['id'].to_i
  end

  def self.all()
    sql = "SELECT * from tickets"
    ticket_data = SqlRunner.run(sql)
    return ticket_data.map{ |ticket| Ticket.new(ticket)}
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, film_id) = ($1, $2)
    WHERE id = $3"
    values = [@customer_id, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM tickets where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def customer()
    sql = "SELECT * FROM customers WHERE customers.id = $1"
    values = [@customer_id]
    customer_data = SqlRunner.run(sql, values)
    return customer_data.map{ |customer| Customer.new(customer) }
  end

  def film()
    sql = "SELECT * FROM films WHERE films.id = $1"
    values = [@film_id]
    film_data = SqlRunner.run(sql, values)
    return film_data.map{ |film| Film.new(film) }
  end

end
