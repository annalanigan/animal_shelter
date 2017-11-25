require_relative('../db/sql_runner')

class Owner

  attr_reader :id, :name, :address, :phone_number
  attr_accessor :home_check

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

end
