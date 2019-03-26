class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  
  def index
    @items = Item.where(status: 'approved')
  end
    
  def show
    @item = Item.find(params[:id])
  end
    
  def new
    @item = Item.new
  end
    
  def create
    @item = Item.new(items_params)
    @item.status = 'pending'
    @item.save
    redirect_to root_url
  end
    
  #edit exisiting database entry -- only available to admin
  def edit
    @item = Item.find(params[:id])
  end
    
  #update exisiting database entry -- only available to admin
  def update
    @item = Item.find(params[:id])
    @item.update(items_params)
    @item.status = 'pending'
    @item.save
    redirect_to admins_url
  end
    
  #destroy database entry 
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admins_url
  end
    
  private
  
  def items_params
    params.require(:item).permit(:name, :date, :description, :price, :facility_id)
  end
    
end
