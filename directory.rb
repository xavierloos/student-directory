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
#We print the list of students
puts "The students of Makers Academy"
puts "______________________________"
students.each do |student|
  puts student
end
#We print the total number of students
puts "Overall, we have #{students.count} great student"
