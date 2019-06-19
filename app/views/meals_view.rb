class MealsView
  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1} Name: #{meal.name} | Price: #{meal.price}"
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
