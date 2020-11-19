@students = [] # an empty array accessible to all methods
#Put all student into an array
#8.5 Add more information: hobbies, country of birth, height, etc.
# @students = [
#   { name: "Dr. Hannibal Lecter", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
#   { name: "Darth Vader", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
#   { name: "Nurse Ratched", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
#   { name: "Michael Corleone", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
#   { name: "Alex DeLarge", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
#   { name: "The Wicked Witch of the West", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
#   { name: "Terminator", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
#   { name: "Freddy Krueger", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
#   { name: "The Joker", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
#   { name: "Joffrey Baratheon", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
#   { name: "Norman Bates", cohort: :november, hobbies: "Football", country: "Mexico", height: "169cm" },
# ]

def print_header
  #We print the list of students
  puts "____________________________________________________"
  # 8.6 Method center() of the String Use it in your code to make the output beautifully aligned.
  puts "The students of Makers Academy".center(50)
  puts "----------------------------------------------------"
end

def students
  if @students.size > 0
    print_header
    @students.each.with_index(1) do |student, index|
      puts "#{index}. #{student[:name]}. Cohort: #{student[:cohort]}"
    end
    print_footer
  else
    puts "No students found, please (1) add students to the list or (2) see from a specific file"
  end
end

def print_std
  puts "Options:"
  puts "See = See all the students"
  puts "Search = Search a specific students per letter"
  puts "Shorter = Print the students whose name is shorter than 12 characters."
  puts "Cohort = Print the students grouped by cohort."
  option = STDIN.gets.chomp.capitalize
  case option
  when "See"
    #8.1 - Modify the program to print a number before the name of each student, e.g. "1. Dr. Hannibal Lecter" Hint: look into each.with_index()
    print_header
    students
    # 8.4 Rewrite the each() method that prints all students using while or until control flow methods (Loops).
    # st = students.length
    # while st > 0
    #   student = students.
    #   puts"#{student[:name]} "
    #   st -= 1
    # end
  when "Search"
    #8.2 - Modify your program to only print the students whose name begins with a specific letter.
    puts "Which letter whould you like to search for?"
    letter = STDIN.gets.chomp
    puts "We have some results with the letter: #{letter}"
    @students.each.with_index(1) do |student, index|
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].include? letter
    end
  when "Shorter"
    #8.3 - Modify your program to only print the students whose name is shorter than 12 characters.
    puts "We have some results with the name shorter than 12 characters"
    @students.each.with_index(1) do |student, index|
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].size < 12
    end
  when "Cohort"
    #8.8 Once you complete the previous exercise, change the way the users are displayed: print them grouped by cohorts. To do this, you'll need to get a list of all existing cohorts (the map() method may be useful but it's not the only option), iterate over it and only print the students from that cohort.
    puts "Group by cohort"
    group = {}
    @students.each do |student|
      cohort = student[:cohort]
      name = student[:name]
      group[cohort] = [] if group[cohort] == nil
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

def print_footer
  #We print the total number of students
  if @students.count == 1
    puts "____________________________________________________"
    puts "Total: #{@students.count} student".center(50)
    puts "----------------------------------------------------"
  else
    puts "____________________________________________________"
    puts "Total: #{@students.count} students".center(50)
    puts "----------------------------------------------------"
  end
end

def input_students
  puts "* To finish, just hit return twice"
  puts "Name"
  #get the fisrt name
  name = STDIN.gets.chomp
  #8.7 In the input_students method the cohort value is hard-coded. How can you ask for both the name and the cohort? What if one of the values is empty? Can you supply a default value? The input will be given to you as a string? How will you convert it to a symbol? What if the user makes a typo?
  #while the name is not empty repeat this code
  puts "Cohort:"
  cohort = STDIN.gets.chomp.to_s
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
    puts "Name:"
    name = STDIN.gets.strip
    puts "Cohort:"
    cohort = STDIN.gets.chomp.to_s
  end
  @students
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "------------------------------------"
  puts "|        *    MAIN MENU   *        |"
  puts "|                                  |"
  puts "|        1. Add the students       |"
  puts "|        2. Show the students      |"
  puts "|        3. Save the students      |"
  puts "|        4. See student files      |"
  puts "|                                  |"
  puts "|                         9. Exit  |"
  puts "------------------------------------"
end

def show_students
  students
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "Try again"
  end
end

# 11.Saving the data to a file
def save_students
  if @students.count == 0
    puts "Students information not provided, please first (1) add some students"
    interactive_menu
  else
    puts "File name:"
    file_name = STDIN.gets.chomp
    file_name << ".csv"
    # open the file for writing
    # file = File.open(file_name, "w")

    CSV.open(file_name, "w") do |csv|
      # Iterante over the array of students
      @students.each do |student|
        csv << [student[:name], student[:cohort]]
        # student_data = [student[:name], student[:cohort]]
        # csv_line = student_data.join(",")
        # file.puts csv_line
      end
    end
    puts "Students saved"
  end
end

def load_students(file_name = "")
  files = []
  for f in Dir.new(".")
    files = files.push(f) if f.include? "csv"
  end
  if files.count == 0
    puts "Files not found, please (3) save a new file"
    interactive_menu
  else
    puts "Which file whould you like to see:"
    puts "=> #{files}"
    # Print all the files with the extentions CSV
    file_name = gets.chomp
    # Create an array to nest the files and the compare the names with the name provide by the user

    # If the name provided is found in the array file will print the list of students
    if files.include? file_name
      file = File.open(file_name, "r")
      file.readlines.each do |line|
        name, cohort = line.chomp.split(",")
        @students << { name: name, cohort: cohort.to_sym }

        @students.each.with_index(1) do |student, index|
          puts "____________________________________________________"
          puts "The students of #{file_name}".center(50)
          puts "----------------------------------------------------"
          puts "#{index}. #{student[:name]} #{student[:cohort]}"
          print_footer
        end
      end
      file.close
    else
      puts "404 - File not found"
      puts "Try again"
      Dir.new(".").each { |file| puts file if file.include? "csv" }
      file_name = STDIN.gets.chomp
    end
  end
end

# def try_load_students
#   file_name = ARGV.first #first arg from the command line
#   return if file_name.nil? #get out of the method if it isn't given
#   if File.exists?(file_name) #if it exist
#     load_students(file_name)
#     puts"Loaded #{@students.count} from #{file_name}"
#   else
#     puts"Sorry, #{file_name} doesn't exist"
#     exit
#   end
# end

# try_load_students
interactive_menu
