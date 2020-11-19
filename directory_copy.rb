@student = [] # an empty array accessible to all methods
#Put all student into an array
#8.5 Add more information: hobbies, country of birth, height, etc.
@students = [
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
  p "____________________________________________________"
  # 8.6 Method center() of the String Use it in your code to make the output beautifully aligned.
  p "The students of Makers Academy".center(50)
  p "----------------------------------------------------"
end

def print_students
  p "Options:"
  p "See = See all the students"
  p "Search = Search a specific students per letter"
  p "Shorter = Print the students whose name is shorter than 12 characters."
  p "Cohort = Print the students grouped by cohort."
  option = gets.chomp.capitalize
  case option
  when "See"
    #8.1 - Modify the program to print a number before the name of each student, e.g. "1. Dr. Hannibal Lecter" Hint: look into each.with_index()
    print_header
    @students.each.with_index(1) do |student, index|
      p "#{index}. #{student[:name]} #{student[:cohort]} #{student[:hobbies]}"
    end
    # 8.4 Rewrite the each() method that prints all students using while or until control flow methods (Loops).
    # st = students.length
    # while st > 0
    #   student = students.
    #   p "#{student[:name]} "
    #   st -= 1
    # end
  when "Search"
    #8.2 - Modify your program to only print the students whose name begins with a specific letter.
    p "Which letter whould you like to search for?"
    letter = gets.chomp
    p "We have some results with the letter: #{letter}"
    @students.each.with_index(1) do |student, index|
      p "#{index}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].include? letter
    end
  when "Shorter"
    #8.3 - Modify your program to only print the students whose name is shorter than 12 characters.
    p "We have some results with the name shorter than 12 characters"
    @students.each.with_index(1) do |student, index|
      p "#{index}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].size < 12
    end
  when "Cohort"
    #8.8 Once you complete the previous exercise, change the way the users are displayed: print them grouped by cohorts. To do this, you'll need to get a list of all existing cohorts (the map() method may be useful but it's not the only option), iterate over it and only print the students from that cohort.
    p "Group by cohort"
    group = {}
    @students.each do |student|
      cohort = student[:cohort]
      name = student[:name]
      group[cohort] = [] if group[cohort] == nil
      group[cohort].push(name)
    end
    group.each do |key, value|
      p "COHORT: #{key}"
      p "STUDENT"
      for name in value
        p "#{name}"
      end
    end
  else
    p "Nothing to show"
  end
end

def print_footer
  #We print the total number of students
  p "____________________________________________________"
  p "Overall, we have #{@students.count} great student"
  p "----------------------------------------------------"
end

def input_students
  p "* To finish, just hit return twice"
  p "Name"
  #get the fisrt name
  name = gets.chomp
  #8.7 In the input_students method the cohort value is hard-coded. How can you ask for both the name and the cohort? What if one of the values is empty? Can you supply a default value? The input will be given to you as a string? How will you convert it to a symbol? What if the user makes a typo?
  #while the name is not empty repeat this code
  p "Cohort:"
  cohort = gets.chomp.to_s
  while !name.empty?
    cohort = "november".to_s if cohort == ""
    #add the student hash to the array
    @students << { name: name, cohort: cohort }
    # 8.9 Right now if we have only one student, the user will see a message "Now we have 1 students", whereas it should be "Now we have 1 student". How can you fix it so that it used singular form when appropriate and plural form otherwise?
    @students.count > 1 ? "Now we have #{@students.count} students" : "Now we have #{@students.count} student"
    #8.10 We've been using the chomp() method to get rid of the last return character. Find another method among those provided by the String class that could be used for the same purpose (although it will require passing some arguments).
    # Chomp vs Chop vs Strip: Another two methods that you may find helpful for cleaning user input are chop & strip.
    # With strip you can remove white spaces.
    # With chop you’ll always remove the last character.
    p "Name:"
    name = gets.strip
    p "Cohort:"
    cohort = gets.chomp.to_s
  end
  @students
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  p "------------------------------------"
  p "|        *    MAIN MENU   *        |"
  p "|       1. Input the students      |"
  p "|        2. Show the students      |"
  p "|        3. Save the students      |"
  p "|              9. Exit             |"
  p "------------------------------------"
end

def show_students
  print_header
  print_students
  print_footer
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    print_header
    print_students
    print_footer
  when "3"
    save_students
  when "9"
    exit
  else
    p "Try again"
  end
end

# 11.Saving the data to a file
def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # Iterante over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  p "Students saved"
end

interactive_menu
