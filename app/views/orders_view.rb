class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      delivered = order.delivered? ? "[X]" : "[ ]"
      puts "#{index + 1}. #{order.meal.name} : customer: #{order.customer.name} rider: #{order.employee.username}"
    end
  end
end
