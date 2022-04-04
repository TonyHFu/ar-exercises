require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...

class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: {minimum: 3}
  validates :annual_revenue, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  # validate :at_least_one_of_men_or_women

  def at_least_one_of_men_or_women 
    if :mens_apparel != true && :womens_apparel != true
      errors.add(:apparel, "Must carry at least one of men's or women's apparel")
    end

  end

end

class Employee < ActiveRecord::Base
  belongs_to :store
  validates :store, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }

end

# print "Enter a store name: "
# storeName = gets.chomp
storeName = "Null"

store = Store.create(name: storeName, mens_apparel: false, womens_apparel: false)

puts store.errors.full_messages
puts store.errors[:at_least_one_of_men_or_women]
