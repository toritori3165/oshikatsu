class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:edit, :show, :update]

  def index
    @orders_a = current_user.orders.where.not(content_name: "")
    @orders_b = current_user.orders.where.not(event_name: "")
  end  

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to order_path(@order.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    order = Order.find(params[:id])
    if order.destroy
    redirect_to root_path
    end
  end

  def search
    if params[:search].present?
      @orders = current_user.orders.where('orders.group LIKE ?', "%#{params[:search]}%")
    else
      @orders = current_user.orders
    end
  end


  private

  def order_params
    params.require(:order).permit(:group, :content_name, :event_name, :price, :memo, :date_of_payment, :event_day, user_ids: [])
  end

  def set_order
    @order = Order.find(params[:id])
  end
end


