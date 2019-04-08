class AdminsController < ApplicationController
  # restrict methods (except signup) in this file to admin only
  before_action :authenticate_user!, except: [:signup]
  
  # doesn't need to load anything for admin index 
  def index
  
  end

  # loads a bill and changes it's status to approved
  def approve_bill
    @bill = Bill.find(params[:id])
    @bill.status = 'approved'
    @bill.save
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

  # load all bills to pass into view
  def show_bills
    @bills = Bill.all
  end

  # load pending bills to pass into view
  def show_pending_bills
    @bills = Bill.where(status: 'pending')
  end


  #signup for new admins
  def signup

  end
end
