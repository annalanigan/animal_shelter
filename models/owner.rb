require_relative('../db/sql_runner')
require_relative('animal')

class Owner

  attr_accessor :home_check, :id, :name, :address, :phone_number

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @address = options['address']
    @phone_number = options['phone_number']
    @home_check = options['home_check'] if options['home_check']
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
          ($1, $2, $3, FALSE)'
    values = [@name, @address, @phone_number]
    result = SqlRunner.run(sql,values)
  end

  def update
    sql = 'UPDATE owners
          SET (
            name,
            address,
            phone_number,
            home_check) =
            ($1, $2, $3, $4)
          WHERE id = $5'
    values = [@name, @address, @phone_number, @home_check, @id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = 'SELECT * FROM owners'
    result = SqlRunner.run(sql)
    result.map { |owner| Owner.new(owner) }
  end

  #SHOW ALL
  def self.animals
    sql = 'Select owners.*, animals.name AS animal_name
          FROM owners, animals
          WHERE animals.owner_id = owners.id'
    SqlRunner.run(sql)
  end

  #FIND BY ID
  def self.find(id)
    sql = 'SELECT * FROM owners
          WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql,values).first
    return Owner.new(result)
  end

  def delete
    sql = 'DELETE FROM owners
          WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.owners_no_pets
    sql = 'SELECT * FROM owners o
          WHERE o.id
          NOT IN (SELECT o.id FROM owners o
          INNER JOIN animals a
          ON o.id = a.owner_id)'
    SqlRunner.run(sql)
  end

end
