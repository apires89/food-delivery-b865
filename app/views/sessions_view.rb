class SessionsView
  def display(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username} : #{employee.role}"
    end
  end


  def ask_for(input)
    puts "What is the #{input}?"
    gets.chomp
  end

  def print_wrong_credentials
    puts "Something went wrong! Try again.."
  end


end
