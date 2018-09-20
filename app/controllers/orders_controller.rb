class OrdersController < ApplicationController

  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def create
    last_order = current_user.orders.last
    success_message = 'Thanks for your order :)'
    if last_order && current_user.can_still_add_pasta?(last_order)
      last_order.package.pastas_packages_relationships.create(pasta_id: params[:pasta_id])
      flash[:notice] = success_message
    else
      new_order = Order.new(user: current_user)
      if new_order.save
        package = new_order.create_package(order_id: new_order.id)
        package.pastas_packages_relationships.create(pasta_id: params[:pasta_id], package_id: package.id)
        flash[:notice] = success_message
      else
        Order.destroy(order.id)
        flash[:alert] = 'Something went wrong :('
      end
    end
    redirect_to root_path
  end



end
