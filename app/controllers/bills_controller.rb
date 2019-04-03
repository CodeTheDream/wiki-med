class BillsController < ApplicationController
  
  @total=0.0
 def total
  bill.item.price.each do |price|
   @total += price
  end
 end

 def index
   @bills = Bill.all
 end
 
 def new
   @bill = Bill.new
   1.times {@bill.items.build}
 end 
 
 def create
   @bill = Bill.new(bill_params)
   @bill.status = "pending"
   @bill.price = @bill.total
  if !verify_recaptcha(model: @bill) || !@bill.save
    flash.now[:danger]="You are a Robot"
   render 'new'
  else
  redirect_to root_path
  end
 end 

 private
  def bill_params
    params.require(:bill).permit(:date, :facility_id, :procedure_id, items_attributes:[:name, :description, :price, :id, :_destroy])
  end 
end
