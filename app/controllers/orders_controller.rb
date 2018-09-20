class OrdersController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @orders = current_user.orders
  end

  def create
    order = Order.create(user: current_user)
    if order.valid?
      package = order.create_package(order_id: order.id)
      package.pastas_packages_relationships.create(pasta_id: params[:pasta_id], package_id: package.id)
      flash[:notice] = 'Thanks for your order :)'
      redirect_to root_path
    else
      Order.destroy(order.id)
      flash[:alert] = 'Something went wrong :('
    end
  end

end
