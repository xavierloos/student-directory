#Put all student into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex Delarge",
  "The Wicked Witch of the west",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Barat,heon",
  "Norman Bates",
]

def print_header
  #We print the list of students
  puts "The students of Makers Academy"
  puts "______________________________"
end

def print(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  #We print the total number of students
  puts "Overall, we have #{names.count} great student"
end

#We call the methods
print_header
print(students)
print_footer(students)
