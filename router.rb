# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      @employee = @sessions_controller.login
      while @employee
        if @employee.manager?
          display_manager_actions
          action = gets.chomp.to_i
          print `clear`
          perform_manager(action)
        else
          display_employee_actions
          action = gets.chomp.to_i
          print `clear`
          perform_employee(action)
        end
      end

    end
  end

  def display_manager_actions
    puts ""
    puts "** *** **** *** **"
    puts "*** ** MENU ** ***"
    puts "** *** **** *** **"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a customer"
    puts "9 - Log out"
    puts "0 - Quit"
    puts "CTRL + C - Rage Quit"
  end

  def display_employee_actions
    puts ""
    puts "** *** **** *** ***"
    puts "** EMPLOYEE MENU **"
    puts "** *** **** *** ***"
  end

  def perform_manager(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then @employee = nil
    when 0 then stop
    else puts "Not an option!"
    end
  end

  def perform_employee(action)
    # TODO
  end

  def stop
    @employee = nil
    @running = false
  end
end
