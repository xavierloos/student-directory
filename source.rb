# print executable file source code

def interactive_menu
  loop do
    print_menu
    options(STDIN.gets.chomp)
  end
end

def print_menu
  puts "------------------------------------"
  puts "|        *    MAIN MENU   *        |"
  puts "|                                  |"
  puts "|       1. Print my own code       |"
  puts "|         2. Print my name         |"
  puts "|       3. Print my directory      |"
  puts "|         4. Print my path         |"
  puts "|                                  |"
  puts "|                         9. Exit  |"
  puts "------------------------------------"
end

def options(number)
  case number
  when "1"
    puts "PRINTING MY OWN CODE"
    puts File.read(__FILE__)
  when "2"
    puts "PRINTING MY NAME"
    puts __FILE__
  when "3"
    puts "PRINTING MY DIRECTORY NAME"
    puts File.dirname(__FILE__)
  when "4"
    puts "PRINTING MY PATH"
    puts File.expand_path(File.dirname(__FILE__))
  when "9"
    exit
  end
end

interactive_menu
