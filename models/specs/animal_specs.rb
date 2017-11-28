
require( 'pry-byebug' )
require_relative('../animal')
require_relative('../owner')


owner1= Owner.new({'name' => 'Bill Barking', 'address' => '10 Leash Avenue', 'phone_number' => '0131 447 6568'})
owner2= Owner.new({'name' => 'Felicity Feline', 'address' => '104 Purrings Lane', 'phone_number' => '1030 998 4453'})

animal1= Animal.new({'name' => 'Poppy', 'type' => 'dog', 'breed' => 'springer spaniel', 'admission_date' => '17/10/2017', 'image' => 'Springer.jpg'})
animal2= Animal.new({'name' => 'Sunflower', 'type' => 'cat', 'breed' => 'burmese', 'admission_date' => '12/09/2017', 'image' => 'burmese.jpg'})
animal3= Animal.new({'name' => 'Daisy', 'type' => 'dog', 'breed' => 'boxer', 'admission_date' => '01/08/2017', 'image' => 'boxer.jpg'})



binding.pry
nil
