class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :base_params, :create_params, :update_params]
  
  def index
    @items=Item.where("status = 'approved'")
  end
    
  def show
    @item=Item.find(params[:id])
  end
    
  def new
    @item=Item.new
  end
    
  def create
    @item = Item.create(create_params)
    @item.status = "pending"
    @item.save
    redirect_to "/"
  end
    
  #edit exisiting database entry -- only available to admin
  def edit
    @item = Item.find(params[:id])
  end
    
  #update exisiting database entry -- only available to admin
  def update
    @item = Item.find(params[:id])
    @item.update(update_params)
    @item.status = 'pending'
    @item.save
    redirect_to "/admins"
  end
    
  #destroy database entry 
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to "/admins"
  end
    
  private
  
  def base_params
    params.require(:item)
  end
  
  def create_params
    base_params.permit(:name, :date, :description, :price, :facility_id)
  end
  
  def update_params
    base_params.permit(:name, :date, :description, :price, :facility_id)
  end
    
end
