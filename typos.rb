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
  # 8.6 Method center() of the String Use it in your code to make the output beautifully aligned.
  puts "The students of Makers Academy".center(50)
  puts "----------------------------------------------------"
end

def print(students)
  puts "Options:"
  puts "See = See all the students"
  puts "Search = Search a specific students per letter"
  puts "Shorter = Print the students whose name is shorter than 12 characters."
  puts "Cohort = Print the students grouped by cohort."
  option = gets.chomp.capitalize
  case option
  when "See"
    #8.1 - Modify the program to print a number before the name of each student, e.g. "1. Dr. Hannibal Lecter" Hint: look into each.with_index()
    print_header
    students.each.with_index(1) do |student, index|
      puts "#{index}. #{student[:name]} #{student[:cohort]} #{student[:hobbies]}"
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
  when "Cohort"
    #8.8 Once you complete the previous exercise, change the way the users are displayed: print them grouped by cohorts. To do this, you'll need to get a list of all existing cohorts (the map() method may be useful but it's not the only option), iterate over it and only print the students from that cohort.
    puts "Group by cohort"
    group = {}
    students.each do |student|
      cohort = student[:cohort]
      name = student[:name]
      if group[cohort] == nil
        group[cohort] = []
      end
      group[cohort].push(name)
    end
    group.each do |key, value|
      puts "COHORT: #{key}"
      puts "STUDENT"
      for name in value
        puts "#{name}"
      end
    end
  else
    puts "Nothing to show"
  end
end

def print_footer(names)
  #We print the total number of students
  puts "Overall, we have #{names.count} great student"
end

def input_students
  #create an empty array
  students = []
  puts "* To finish, just hit return twice"
  puts "Name"
  #get the fisrt name
  name = gets.chomp
  #8.7 In the input_students method the cohort value is hard-coded. How can you ask for both the name and the cohort? What if one of the values is empty? Can you supply a default value? The input will be given to you as a string? How will you convert it to a symbol? What if the user makes a typo?
  #while the name is not empty repeat this code
  puts "Cohort:"
  cohort = gets.chomp.to_s
  while !name.empty?
    if cohort == ""
      cohort = "november".to_s
    end
    #add the student hash to the array
    students << { name: name, cohort: cohort }
    # 8.9 Right now if we have only one student, the user will see a message "Now we have 1 students", whereas it should be "Now we have 1 student". How can you fix it so that it used singular form when appropriate and plural form otherwise?
    if students.count > 1
      puts "Now we have #{students.count} students"
    else
      puts "Now we have #{students.count} student"
    end
    puts "Name:"
    name = gets.chomp
    puts "Cohort:"
    cohort = gets.chomp.to_s
  end
  students
end

#We call the methods
students = input_students

print(students)
print_footer(students)
