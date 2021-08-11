class Admin::OrdersController < ApplicationController
  
  def show
    
    @order = Order.find(params[:id])
    
  end
    
  def update
    
    @order = Order.find(params[:id])
    @order.update(order_params)
    
    if @order.status == "入金確認"
      @order.order_details.update(production_status: 1)
    end
      flash[:success] = "更新しました"
      redirect_to admin_order_path(@order)
      
  end
    
  private
    
  def order_params
      
    params.require(:order).permit(:status)
        
  end
  
end
