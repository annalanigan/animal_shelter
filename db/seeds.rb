require_relative('../models/animal')
require_relative('../models/owner')

owner1= Owner.new({'name' => 'Bill Barking', 'address' => '10 Leash Avenue', 'phone_number' => '0131 447 6568'})
owner1.save
owner2= Owner.new({'name' => 'Felicity Feline', 'address' => '104 Purrings Lane', 'phone_number' => '1030 998 4453'})
owner2.save

animal1= Animal.new({'name' => 'Poppy', 'type' => 'dog', 'breed' => 'springer spaniel', 'admission_date' => '17/10/2017', 'image' => 'Springer.jpg'})
animal1.save
animal2= Animal.new({'name' => 'Sunflower', 'type' => 'cat', 'breed' => 'burmese', 'admission_date' => '12/09/2017', 'image' => 'burmese.jpg'})
animal2.save
animal3= Animal.new({'name' => 'Daisy', 'type' => 'dog', 'breed' => 'boxer', 'admission_date' => '01/08/2017', 'image' => 'boxer.jpg'})
animal3.save
