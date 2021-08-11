class Public::CartItemsController < ApplicationController
  before_action :authenticate_costomer!
  
  def index
    
    @cart_items = current_end_user.cart_items
    
  end
    
  def create
    
    if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      @cart_items = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_items.amount += params[:cart_item][:amount].to_i
      @cart_items.update(amount: @cart_items.amount)
      redirect_to cart_items_path
        
    else @cart_item_new = CartItem.new(cart_item_params)
            
    if @cart_item_new.save
      redirect_to cart_items_path
    else 
      @item = @cart_item_new.item
      render "public/items/show"
    end
    end
    
  end
  
  def update
    
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice]="変更しました"
      redirect_to cart_items_path
    else 
      render "public/cart_items/index"
    end
    
  end
    
  def destroy
    
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
    
  end
    
  def destroy_all
    
    @cart_item = current_end_user.cart_items
    @cart_item.destroy_all
      redirect_to root_path
      
  end
    
  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :end_user_id)
  end
  
  
end
