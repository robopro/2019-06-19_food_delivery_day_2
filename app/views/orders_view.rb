class OrdersView
  def display(element)
    element.each_with_index do |element, index|
      puts "#{index + 1}. ID: #{element.id} | "\
           "Customer: #{element.customer.name} | "\
           "Meal: #{element.meal.name} | "\
           "Delivery guy: #{element.employee.username}"
    end
  end

  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. Meal: #{meal.name}"
    end
  end

  def display_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. Customer: #{customer.name} | Address: #{customer.address}"
    end
  end

  def display_delivery_guys(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. Employee: #{employee.username}"
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
