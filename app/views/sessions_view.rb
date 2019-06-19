class SessionsView
  def ask_for_string(attribute)
    puts "Please enter #{attribute}:"
    gets.chomp
  end

  def welcome
    puts "You're successfully logged in"
  end

  def incorrect_credentials
    puts 'Incorrect credentials, try again'
  end
end
