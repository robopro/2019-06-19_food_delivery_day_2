# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
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
    puts "5 - List undelivered orders"
    puts "9 - Log out"
    puts "0 - Quit"
    puts "CTRL + C - Rage Quit"
  end

  def display_employee_actions
    puts ""
    puts "** *** **** *** ***"
    puts "** EMPLOYEE MENU **"
    puts "** *** **** *** ***"
    puts "1 - List my orders"
    puts "2 - Mark an order"
    puts "9 - Log out"
    puts "0 - Quit"
  end

  def perform_manager(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.list_undelivered_orders
    when 6 then @orders_controller.add
    when 9 then @employee = nil
    when 0 then stop
    else puts "Not an option!"
    end
  end

  def perform_employee(action)
    # TODO
    case action
    when 1 then @orders_controller.list_my_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    when 9 then @employee = nil
    when 0 then stop
    else puts "Not an option!"
    end
  end

  # We need to set @employee = nil.
  # Because the while loop (line 14) runs until @employee is falsey (nil).
  # And we need to set @running to false.
  # Because the first while loop (line 12) runs until @running is false.
  def stop
    @employee = nil
    @running = false
  end
end
