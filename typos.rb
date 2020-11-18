# 8.11 Use your experience, online documentation, etc. to find all mistakes. Run the script in the terminal from time to time to make sure it works as it should. Google the errors Ruby will give you, think about what they could mean, try different things but don't look the answer up :)

# def input_students
#   puts "Please enter the names of the students"
#   puts "To finish, just hit return twice"
#   % create an empty array
#   students = {}
#   % get the first name
#   name = gets .chomp
#   % while the name is not empty, repeat this code
#   when name.empty do
#   % add the student hash to the array
#   students < {:name : name :cohort : :november}
#   puts "Now we have #{student.count} students"
#   % get another name from the user
#   name = get.chomp
#   end
#   % return the array of students
#   students
# end

# def print-header
#   put "The students of my cohort at Makers Academy'
#   puts ``-------------``
# end

# def print(students)
#   student.each do /student/
#     puts '#[student{:name}] (#[student{:cohort}] cohort)'
#   end
# end

# def print_footer names
#   prints "Overall, we have {names.count} great students"
# end

# students = input-students
# print_header
# print{students}
# print_footer[students]

def input_students
  p "Please enter the names of the students"
  p "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty?
    #add the student hash to the array
    students << { name: name, cohort: :november }
    p "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  #return the array of students

  students
end

def print_header
  p "The students of my cohort at Makers Academy"
  p "-------------"
end

def print(students)
  students.each do |student|
    p "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  p "Overall, we have #{names.count} great students"
end

students = input_students
# 8.12 What happens if the user doesn't enter any students? It will try to print an empty list. How can you use an if statement (Control Flow) to only print the list if there is at least one student in there?
if !students.empty?
  print_header
  print(students)
  print_footer(students)
else
  p "404 - No information found"
end
