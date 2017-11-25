require_relative('../db/sql_runner')

class Animal

  attr_reader :id, :name, :type, :admission_date
  attr_accessor :health_check, :behaviour_check, :owners_id

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @type = options['type']
    @health_check = false #always set to false for a new animal.
    @behaviour_check = true #set to true until I reach the extended methods.
    @admission_date = options['admission_date']
    @owners_id = options['owners_id'] if options['owners_id']
  end

  def save
    sql = 'INSERT INTO animals
          (
          name,
          type,
          health_check,
          behaviour_check,
          admission_date
          )
          VALUES
          ($1, $2, FALSE, TRUE, $3)'
    values = [@name, @type, @admission_date]
    result = SqlRunner.run(sql,values)
  end

end
