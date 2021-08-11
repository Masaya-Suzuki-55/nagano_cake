class Admin::OrderDetailsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = @order_detail.order
    
  if params[:order_detail][:production_status] == "製作中"
      @order.update(status: 2)
  end
    
  if @order.order_details.where(production_status: 3).count == @order.order_details.count
      @order.update(status: 3)
  end
      flash[:success] = "更新しました"
      redirect_to admin_order_path(@order)
  end
    
  private
    
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
  
end
