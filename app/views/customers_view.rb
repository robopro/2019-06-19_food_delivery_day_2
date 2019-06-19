class CustomersView
  def display(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1} Name: #{customer.name} | Address: #{customer.address}"
    end
  end

  def ask_for_string(attribute)
    puts "Please enter #{attribute}:"
    gets.chomp
  end

  def ask_for_number(attribute)
    puts "Please enter #{attribute}:"
    gets.chomp.to_i
  end
end
