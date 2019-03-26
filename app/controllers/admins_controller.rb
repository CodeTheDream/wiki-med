class AdminsController < ApplicationController
  before_action :authenticate_user!
    
  def index
    @items = Item.where(status: 'pending')
    @procedures = Procedure.where(status: 'pending')
  end

  def approve_item
    @item = Item.find(params[:id])
    @item.status = 'approved'
    @item.save
    redirect_to admins_url
  end
    
  def approve_procedure
    @procedure = Procedure.find(params[:id])
    @procedure.status = 'approved'
    @procedure.save
    redirect_to admins_url
  end
    
  def show_items
    @items = Item.all
  end
    
  def show_procedures
    @procedures = Procedure.all
  end
    
  def show_facilities
    @facilities = Facility.all
  end
end
