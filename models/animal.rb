require_relative('../db/sql_runner')
require_relative('owner')

class Animal

  attr_accessor :health_check, :behaviour_check, :owner_id, :image, :id, :name, :type, :admission_date, :breed

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @health_check = options['health_check'] if options['health_check']
    @behaviour_check = options['behaviour_check'] if options['behaviour_check']
    @admission_date = options['admission_date']
    @owner_id = options['owner_id'].to_i if options['owner_id']
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
          ($1, $2, $3, false, true, $4, $5)
          RETURNING *'
    values = [@name, @type, @breed, @admission_date, @image]
    result = SqlRunner.run(sql,values)
    @id = result.first()['id'].to_i
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
    return Animal.new(result)
  end

  # check if adopted? ??
  def adopted
    if @owner_id.nil?
      return false
    else
      return true
    end
  end

  #CHECK IF ADOPTABLE
  def adoptable
    if @health_check == "t" && @behaviour_check == "t"
      true
    else
      false
    end
  end

  #SET TO ADOPTABLE?? should this be here or within the views?
  #this is not used currenlty in my erb or view files...
  def vaccinate
    @health_check = true
  end

  #ASSIGN NEW OWNER / UPDATE
  def update
    sql = "UPDATE animals
          SET
          ( name,
            type,
            breed,
            health_check,
            behaviour_check,
            admission_date,
            image ) =
            ( $1, $2, $3, $4, $5, $6, $7)
        WHERE id = $8"
    values = [@name, @type, @breed, @health_check, @behaviour_check, @admission_date, @image, @id]
    SqlRunner.run( sql, values )
  end

  def adopt(owner_id)
    animal = Animal.find(@id)
    sql = "UPDATE animals
          SET
          ( owners_id ) =
            ( $1 )
        WHERE id = $2"
    values = [owner_id, @id]
    SqlRunner.run( sql, values )
  end

  def owner_check
    sql = "SELECT owners.*, animals.name
          FROM owners, animals
          WHERE animals.owners_id = owners.id"
    SqlRunner.run(sql)
  end

end
