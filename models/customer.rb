class Customer

attr_reader :id
attr_accessor :funds, :name

def initialize (options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @funds = options['funds'].to_i
end

end
