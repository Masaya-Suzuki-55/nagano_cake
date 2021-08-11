class Public::CustomersController < ApplicationController
  
  def show
  end
    
  def edit
    
    @end_user = current_end_user
      
  end
    
  def update
      
    @end_user = current_end_user
    if @end_user.update(end_user_params)
      redirect_to my_page_path
    else
      render :edit
    end
      
  end
    
  def confirm
  end
    
  def withdraw
    
    current_end_user.update(is_unsubscribed: true)
    redirect_to root_path
  
  end
    
  private
    
  def end_user_params
    
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number, :is_unsubscribed)
  end
  
  
end
