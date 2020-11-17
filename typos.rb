#Put all student into an array
students = [
  { name: "Dr. Hannibal Lecter", cohort: :november },
  { name: "Darth Vader", cohort: :november },
  { name: "Nurse Ratched", cohort: :november },
  { name: "Michael Corleone", cohort: :november },
  { name: "Alex DeLarge", cohort: :november },
  { name: "The Wicked Witch of the West", cohort: :november },
  { name: "Terminator", cohort: :november },
  { name: "Freddy Krueger", cohort: :november },
  { name: "The Joker", cohort: :november },
  { name: "Joffrey Baratheon", cohort: :november },
  { name: "Norman Bates", cohort: :november },
]

def print_header
  #We print the list of students
  puts "The students of Makers Academy"
  puts "______________________________"
end

def print(students)
  puts "Options:"
  puts "See = See all the students"
  puts "Search = Search a specific students per letter"
  puts "Shorter = Print the students whose name is shorter than 12 characters."
  option = gets.chomp.capitalize
  case option
  when "See"
    #8.1 - Modify the program to print a number before the name of each student, e.g. "1. Dr. Hannibal Lecter" Hint: look into each_with_index()
    students.each.with_index(1) do |student, index|
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  when "Search"
    #8.2 - Modify your program to only print the students whose name begins with a specific letter.
    puts "Which letter whould you like to search for?"
    letter = gets.chomp
    puts "We have some results with the letter: #{letter}"
    students.each.with_index(1) do |student, index|
      if student[:name].include? letter
        puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
  when "Shorter"
    #8.3 - Modify your program to only print the students whose name is shorter than 12 characters.
    puts "We have some results with the name shorter than 12 characters"
    students.each.with_index(1) do |student, index|
      if student[:name].size < 12
        puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
  else
    puts "xs?"
  end
end

def print_footer(names)
  #We print the total number of students
  puts "Overall, we have #{names.count} great student"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the fisrt name
  name = gets.chomp
  #while the name is not empty repeat this code
  while !name.empty?
    #add the student hash to the array
    students << { name: name, cohort: :november }
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

#We call the methods
students = input_students
print_header
print(students)
print_footer(students)
