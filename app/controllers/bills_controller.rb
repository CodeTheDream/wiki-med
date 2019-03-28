class BillsController < ApplicationController
 def total_price
   self.items.sum(:price)
 end 
 
 def new
   @bill = Bill.new
   @bill.items.build

 end 
 
 def create
   @bill = Bill.create(bill_params)
   @bill.price= @bill.total_price
    if @bill.save 
      redirect_to bill_path(@bill) #redirects to a bill show, need to set this up as well
    else
      render 'new'
    end
 end 
 
 private
  def bill_params
      params.require(:bill).permit(:date, :facility, :procedure, items: [:name, :description, :price])
  end 
end

 