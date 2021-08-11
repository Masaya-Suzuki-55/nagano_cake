class Admin::ItemsController < ApplicationController
  
    def index
      
      @items = Item.search(params[:search])
      
    end
    
    def new
      
      @item_new = Item.new
        
    end
    
    def create
      
      @item_new = Item.new(item_params)
      if @item_new.save
        redirect_to admin_item_path(@item_new)
      else
        render :new
      end
        
    end
    
    def show
      
      @item = Item.find(params[:id])
        
    end
    
    def edit
      
      @item = Item.find(params[:id])
        
    end
    
    def update
      
      @item = Item.find(params[:id])
      if @item.save(item_params)
        redirect_to admin_items_path
      else
        render :edit
      end
      
    end
    
    def item_params
      
        params.require(:item).permit(:name, :image, :introduction, :price, :is_active, :genre_id)
        
    end
    
end
