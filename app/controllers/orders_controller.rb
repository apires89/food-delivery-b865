require_relative "../views/orders_view"
require_relative "../models/order"
require_relative "../views/meals_view"
require_relative "../models/meal"
require_relative "../views/customers_view"
require_relative "../models/customer"
require_relative "../views/sessions_view"
require_relative "../models/employee"

class OrdersController
  def initialize(meal_repository,customer_repository,employee_repository,order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @sessions_view = SessionsView.new
  end

  def list_undelivered_orders
    #fetch from repo
    undelivered_orders = @order_repository.undelivered_orders
    #send to view
    @orders_view.display(undelivered_orders)
  end

  def add
    #ask the user for a employee
    meal = select_meal
    #ask the user for a customer
    customer = select_customer
    #ask the user for an employee
    employee = select_employee
    #create the order
    order = Order.new(meal: meal, customer: customer, employee: employee)
    #add it to the repository
    @order_repository.create(order)
  end

  private

  def select_meal
    #list all the meal(meal view)
    @meals_view.display(@meal_repository.all)
    # ask the user to select one(meal view)
    index = @meals_view.ask_user_for("index").to_i - 1
    # fetch that one from the repo(meal repository)
    @meal_repository.all[index]
  end

  def select_customer
    #list all the customer(customer view)
    @customers_view.display(@customer_repository.all)
    # ask the user to select one(customer view)
    index = @customers_view.ask_user_for("index").to_i - 1
    # fetch that one from the repo(customer repository)
    @customer_repository.all[index]
  end

  def select_employee
    #list all the employee(employee view)
    @sessions_view.display(@employee_repository.all_riders)
    # ask the user to select one(employee view)
    index = @sessions_view.ask_for("index").to_i - 1
    # fetch that one from the repo(employee repository)
    @employee_repository.all_riders[index]
  end



end
