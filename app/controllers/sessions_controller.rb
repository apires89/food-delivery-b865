require_relative "../views/sessions_view"

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def login
    #1. Ask user for username
    username = @sessions_view.ask_for("username")
    #2. Ask user for password
    password = @sessions_view.ask_for("password")
    #2.5 Fetch the employee from the repo
    employee = @employee_repository.find_by_username(username)
    #3. Check if they match
    if employee && employee.password == password
      return employee # send it to router
    #4. show the aproriate menu (router)
    else
      #go back to the start of the method
     @sessions_view.print_wrong_credentials
     login
    end
  end
end
