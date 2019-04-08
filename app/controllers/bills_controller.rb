class BillsController < ApplicationController 
  # restricts access to update, edit and destroy to admins
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  # loads all bills to pass into view
  def index
    if params[:search]
    @procedures = Procedure.where('name LIKE ?', "%#{params[:search]}%")
	  @bills = Bill.where(:procedure_id =>[@procedures])
    else
	    @bills = Bill.all
    end
  end
 
  # creates a new bill with nested items to pass into view
  def new
    @bill = Bill.new
    @bill.items.build
  end 
 
  # saves a new bill and sets status to 'pending' and redirects to adm
  # in page if user is logged in
  def create
    @bill = Bill.new(bill_params)
    @bill.status = "pending"
    @bill.price = total(@bill)
    @bill.save
    if (user_signed_in?)
      redirect_to admins_url
    else
      redirect_to root_url
    end

  end

  # creates an instance variable for an existing bill to edit
  # available only to admins
  def edit
    @bill = Bill.find(params[:id])
  end

  # updates an existing bill and redirects to admin path  
  def update
    @bill = Bill.find(params[:id])
    @bill.update(bill_params)
    @bill.price = total(@bill)
    @bill.status = 'pending'
    @bill.save
    redirect_to admins_url
  end
 
  
  # destroys an existing bill
  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy
    redirect_to admins_path
  end

  private
  
  # limits params accepted to create/update a bill
  def bill_params
    params.require(:bill).permit(:date, :facility_id, :procedure_id, items_attributes:[:name, :description, :price, :id, :_destroy])
  end

  # passes in a bill and sums up the costs of all that bill's items.  
  # then returns that sum.
  def total(bill)
    sum=0.0
    bill.items.each do |i|
      sum += i.price
    end
    return sum
  end
 
end
