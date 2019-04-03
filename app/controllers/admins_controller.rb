class AdminsController < ApplicationController
  # restrict methods (except signup) in this file to admin only
  before_action :authenticate_user!, except: [:signup]
  
  # load add items procedures and facilities to pass into index view ----- will chage to pending bills once that is working 
  def index
    @items = Item.all
    @procedures = Procedure.all
    @facilities = Facility.all
  end

  # not going to need once approve bill is working
  def approve_item
    @item = Item.find(params[:id])
    @item.status = 'approved'
    @item.save
    redirect_to admins_url
  end
  
  #not going to need this once approve bill is working  
  def approve_procedure
    @procedure = Procedure.find(params[:id])
    @procedure.status = 'approved'
    @procedure.save
    redirect_to admins_url
  end
  
  # load all items to pass into view  
  def show_items
    @items = Item.all
  end
  
  # load all procedures to pass into view  
  def show_procedures
    @procedures = Procedure.all
  end
  
  # load all facilities to pass into view  
  def show_facilities
    @facilities = Facility.all
  end

  #signup for new admins
  def signup

  end
end
