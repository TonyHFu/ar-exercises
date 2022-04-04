require_relative "./setup.rb"
require_relative './exercises/exercise_1'
require_relative './exercises/exercise_2'
require_relative './exercises/exercise_3'
require_relative './exercises/exercise_4'
require_relative './exercises/exercise_5'
require_relative './exercises/exercise_6'
require_relative './exercise_1'

class Store < ActiveRecord::Base
  has_many :employees
  
  validates :name, length: {minimum: 3}
  validates :annual_revenue, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  # validate :at_least_one_of_men_or_women

  before_destroy :has_no_employees

  private
  def at_least_one_of_men_or_women 
    if :mens_apparel != true && :womens_apparel != true
      errors.add(:apparel, "Must carry at least one of men's or women's apparel")
    end

  end

  def has_no_employees
    self.employees.count == 0
  end


end


# Make sure non-empty stores cannot be destroyed


@store1 = Store.find(1)

if @store1.destroy
  puts "Store destroyed! It has #{@store1.employees.size} =/"
else
  puts "Could not destroy store :)"
end

# Make sure empty stores can be destroyed
@empty_store = Store.create!(name: 'Test Empty Store', annual_revenue: 0)
if @empty_store.destroy
  puts "Empty Store destroyed! This is good"
else
  puts "Whoa! Empty store should be destroyable... Not cool!"
end
