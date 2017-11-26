require_relative('../db/sql_runner')
require_relative('owner')

class Animal

  attr_reader :id, :name, :type, :admission_date, :breed
  attr_accessor :health_check, :behaviour_check, :owner_id, :image

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @health_check = false #always set to false for a new animal.
    @behaviour_check = true #set to true until I reach the extended methods.
    @admission_date = options['admission_date']
    @owner_id = options['owner_id'] if options['owner_id']
    @image = options['image']
  end

  def save
    sql = 'INSERT INTO animals
          (
          name,
          type,
          breed,
          health_check,
          behaviour_check,
          admission_date,
          image
          )
          VALUES
          ($1, $2, $3, FALSE, TRUE, $4, $5)'
    values = [@name, @type, @breed, @admission_date, @image]
    result = SqlRunner.run(sql,values)
  end

  #SHOW ALL
  def self.all
    sql = 'SELECT * FROM animals'
    result = SqlRunner.run(sql)
    result.map { |animal| Animal.new(animal) }
  end

  #FIND BY ID
  def self.find(id)
    sql = 'SELECT * FROM animals
          WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql,values).first
    Animal.new(result)
  end

  #CHECK IF ADOPTABLE
  def adoptable?
    if @health_check && @behaviour_check
      "AVAILABLE"
    else
      'Not Yet Available'
    end
  end

  #SET TO ADOPTABLE?? should this be here or withn the views?
  def vaccinate
    @health_check = true
  end

  #ASSIGN NEW OWNER / UPDATE
  def adopt(owner_id)
    sql = "UPDATE animals
          SET
          ( name,
            type,
            breed,
            health_check,
            behaviour_check,
            admission_date,
            owners_id,
            image ) =
            ( $1, $2, $3, $4, $5, $6, $7, $8 )
        WHERE id = $9"
    values = [@name, @type, @breed, @health_check, @behaviour_check, @admission_date, @owners_id, @image, @id]
    SqlRunner.run( sql, values )
  end

end
