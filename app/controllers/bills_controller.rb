class BillsController < ApplicationController 
  
  def index
    @bills = Bill.all
  end
 
  def new
    @bill = Bill.new
    @bill.items.build
  end 
 
  def create
    @bill = Bill.new(bill_params)
    @bill.status = "pending"
    @bill.price = total(@bill)
    if @bill.save
      redirect_to root_url
    else
      render 'new'
    end
  end 
  
  def delete
    @bill = Bill.find(params[:id])
    @bill.destroy
    redirect_to root_url
  end

  private
  
  def bill_params
    params.require(:bill).permit(:date, :facility_id, :procedure_id, items_attributes:[:name, :description, :price, :id, :_destroy])
  end

  def total(bill)
    sum=0.0
    bill.items.each do |i|
      sum += i.price
    end
    return sum
  end

end
