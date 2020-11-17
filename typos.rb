#Put all student into an array
#8.5 Add more information: hobbies, country of birth, height, etc.
students = [
  { name: "Dr. Hannibal Lecter", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
  { name: "Darth Vader", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
  { name: "Nurse Ratched", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
  { name: "Michael Corleone", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
  { name: "Alex DeLarge", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
  { name: "The Wicked Witch of the West", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
  { name: "Terminator", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
  { name: "Freddy Krueger", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
  { name: "The Joker", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
  { name: "Joffrey Baratheon", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
  { name: "Norman Bates", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
]

def print_header
  #We print the list of students
  puts "____________________________________________________"
  puts "The students of Makers Academy".center(50)
  puts "----------------------------------------------------"
  puts "Index" + "Name".center(10) + "Cohort".center(10) + "Hobbies".center(10)
end

def print(students)
  puts "Options:"
  puts "See = See all the students"
  puts "Search = Search a specific students per letter"
  puts "Shorter = Print the students whose name is shorter than 12 characters."
  option = gets.chomp.capitalize
  case option
  when "See"
    #8.1 - Modify the program to print a number before the name of each student, e.g. "1. Dr. Hannibal Lecter" Hint: look into each.with_index()
    print_header
    students.each.with_index(1) do |student, index|
      puts "#{index}.".center(5) + "#{student[:name]}".center(10) + "#{student[:cohort]}".center(10) + "#{student[:hobbies]}".center(10)
    end

    # 8.4 Rewrite the each() method that prints all students using while or until control flow methods (Loops).
    # st = students.length
    # while st > 0
    #   student = students.
    #   puts "#{student[:name]} "
    #   st -= 1
    # end
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

print(students)
print_footer(students)
