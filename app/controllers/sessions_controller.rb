require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @view = SessionsView.new
    @employee_repository = employee_repository
  end

  def login
    # view: ask for username
    username = @view.ask_for_string(:username)
    # view: asking for password
    password = @view.ask_for_string(:password)
    # check if username exists
    employee = @employee_repository.find_by_username(username)
    # if so, check if password correct
    if employee && employee.password == password
      @view.welcome
      employee
    else
      @view.incorrect_credentials
      login
    end
        # if correct, welcome and login
    # view: wrong credentials, ask to try again
  end

end
