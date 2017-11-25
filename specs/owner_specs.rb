require_relative('../models/animal')

owner1= Owner.new({'name' => 'Bill Barking', 'address' => '10 Leash Avenue', 'phone_number' => '0131 447 6568'})
owner1.save
owner2= Owner.new({'name' => 'Felicity Feline', 'address' => '104 Purrings Lane', 'phone_number' => '1030 998 4453'})
owner2.save
