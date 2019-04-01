class BillsController < ApplicationController
 
 def total_price(bill)
   total_price = 0.to_f
   bill.items.each do |item|
    total_price += item.price
   end
   return total_price
 end 
 
 def index
   @bills = Bill.all
 end
 
 def new
   @bill = Bill.new
   3.times {@bill.items.build}
 end 
 
 def create
   bill = Bill.create(bill_params)
  # item = Item.create()
   bill.status = "pending"
   bill.save
  if bill.save
    redirect_to bills_path
  else 
    render 'new'
  end
 end 

 private
  def bill_params
      params.require(:bill).permit(:date, :facility_id, :procedure_id, items_attributes:[:name, :description, :price, :id, :_destroy])
  end 
end
