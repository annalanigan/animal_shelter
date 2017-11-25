require_relative('../db/sql_runner')
require_relative('owner')

class Animal

  attr_reader :id, :name, :type, :admission_date
  attr_accessor :health_check, :behaviour_check, :owner_id

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @type = options['type']
    @health_check = false #always set to false for a new animal.
    @behaviour_check = true #set to true until I reach the extended methods.
    @admission_date = options['admission_date']
    @owner_id = options['owner_id'] if options['owner_id']
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

  #SHOW ALL
  def self.all
    # write Sql - SELECT * FROM animals
    # add values
    # run SqlRunner = returns an array of objects?
    # map those and .new to display
  end

  #FIND BY ID
  def find(id)
    # SQL
    # values = [id]
    #result = sql_runner(sql,values) #returns an array of one object
    #create the new object
  end

  #CHECK IF ADOPTABLE
  def adoptable?(id)
    #if health and behaviour == true
  end

    #SET TO ADOPTABLE??
    def set_adoptable(id)
      # change the values of health and behaviour to true.
      # is this simply a views function rather than a class method?
    end

  #ASSIGN NEW OWNER
  def adopt(id, owner_id)
    #SQL some code here!
    #values = []
    #SqlRunner.run(sql, values)
    #create new object and save it?
  end

end
