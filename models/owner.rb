require_relative('../db/sql_runner')
require_relative('animal')

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

  #SHOW ALL
  def self.all
    # write Sql - SELECT owners.*, animal.name
                # FROM owners, animals
                # WHERE  owners.id = animals.owner_id;
    # add values
    # run SqlRunner = returns an array of objects?
    # map those and .new to display?
  end

end
