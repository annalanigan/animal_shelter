require_relative('../db/sql_runner')
require_relative('animal')

class Owner

  attr_accessor :home_check, :id, :name, :address, :phone_number

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @address = options['address']
    @phone_number = options['phone_number']
    @home_check = true #set default to true until I reach the extensions.
  end

  def save
    sql = 'INSERT INTO owners
          (
          name,
          address,
          phone_number,
          home_check
          )
          VALUES
          ($1, $2, $3, TRUE)'
    values = [@name, @address, @phone_number]
    result = SqlRunner.run(sql,values)
  end

  def self.all
    sql = 'SELECT * FROM owners'
    result = SqlRunner.run(sql)
    result.map { |owner| Owner.new(owner) }
  end

  #SHOW ALL
  def self.animals
    sql = 'SELECT owners.*, animals.name, animals.type
          FROM owners, animals
          WHERE  owners.id = animals.owners_id'
    result = SqlRunner.run(sql, values) #= returns an array of objects?
    # map those and .new to display?
  end

end
