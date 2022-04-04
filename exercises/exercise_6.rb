require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...

class Store < ActiveRecord::Base
  has_many :employees
end

class Employee < ActiveRecord::Base
  belongs_to :store
end

@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store1.employees.create(first_name: "Tony", last_name: "Boss", hourly_rate: 6000000)
@store1.employees.create(first_name: "Bob", last_name: "the Builder III", hourly_rate: 0)


@store2.employees.create(first_name: "Thomas", last_name: "the Train Engine", hourly_rate: 999)
@store2.employees.create(first_name: "Arthur", last_name: "Unknown", hourly_rate: 5)