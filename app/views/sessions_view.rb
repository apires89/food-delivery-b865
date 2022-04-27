class SessionsView

  def ask_for(input)
    puts "What is the #{input}?"
    gets.chomp
  end

  def print_wrong_credentials
    puts "Something went wrong! Try again.."
  end


end
