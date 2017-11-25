require_relative('../models/animal')
require_relative('../models/owner')

owner1= Owner.new({'name' => 'Bill Barking', 'address' => '10 Leash Avenue', 'phone_number' => '0131 447 6568'})
owner2= Owner.new({'name' => 'Felicity Feline', 'address' => '104 Purrings Lane', 'phone_number' => '1030 998 4453'})

animal1= Animal.new({'name' => 'Poppy', 'type' => 'dog', 'admission_date' => '17/10/2017'})
animal2= Animal.new({'name' => 'Sunflower', 'type' => 'cat', 'admission_date' => '12/09/2017'})
animal3= Animal.new({'name' => 'Daisy', 'type' => 'dog', 'admission_date' => '01/08/2017'})
