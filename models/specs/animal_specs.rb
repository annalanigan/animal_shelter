require 'minitest/autorun'
require 'minitest/rg'
require( 'pry-byebug' )
require_relative('../animal')
require_relative('../owner')

class TestLibrary < MiniTest::Test

  def setup
    @owner1= Owner.new({'name' => 'Bill Barking', 'address' => '10 Leash Avenue', 'phone_number' => '0131 447 6568'})
    @owner2= Owner.new({'name' => 'Felicity Feline', 'address' => '104 Purrings Lane', 'phone_number' => '1030 998 4453'})

    @animal1= Animal.new({'name' => 'Poppy', 'type' => 'dog', 'breed' => 'springer spaniel', 'admission_date' => '17/10/2017', 'image' => 'Springer.jpg'})
    @animal2= Animal.new({'name' => 'Sunflower', 'type' => 'cat', 'breed' => 'burmese', 'admission_date' => '12/09/2017', 'image' => 'burmese.jpg'})
    @animal3= Animal.new({'name' => 'Daisy', 'type' => 'dog', 'breed' => 'boxer', 'admission_date' => '01/08/2017', 'owner_id' => 1, 'image' => 'boxer.jpg'})
  end


  def test_adopted__false
    assert_equal(false, @animal1.adopted )
  end

  def test_adopted__true
    assert_equal(true, @animal3.adopted)
  end
  # learnt here that if Hard Coded, the .adopted method works, so it seems that the owner_id is not 'found' when calling it fromthe animal object
  # do I then have t 'find' the object first from the database, with * column data?

end
