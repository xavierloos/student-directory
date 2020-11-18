def interactive_menu
  students = []
  loop do
    p "1. Input the students"
    p "2. Show the students"
    p "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      p "Try again"
    end
  end
end

interactive_menu
