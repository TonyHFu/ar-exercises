require_relative "./setup.rb"
require_relative './exercises/exercise_1'
require_relative './exercises/exercise_2'
require_relative './exercises/exercise_3'
require_relative './exercises/exercise_4'
require_relative './exercises/exercise_5'
require_relative './exercises/exercise_6'
# require_relative './exercises/exercise_7'


puts "Exercise 1 Stretch"
puts "----------"


class Employee < ActiveRecord::Base
  belongs_to :store
  validates :store, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }

  before_save :generate_password

  private 
  
  def generate_password
    self.password = rand(36 ** 8).to_s(36)
    # self.save
  end

end


class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: {minimum: 3}
  validates :annual_revenue, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  # validate :at_least_one_of_men_or_women

  private
  def at_least_one_of_men_or_women 
    if :mens_apparel != true && :womens_apparel != true
      errors.add(:apparel, "Must carry at least one of men's or women's apparel")
    end

  end

end


employee = @store1.employees.create(first_name: "Noob", last_name: "Boss", hourly_rate: 50)

employee.save
