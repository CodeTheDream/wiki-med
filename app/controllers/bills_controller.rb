class BillsController < ApplicationController
  
 def total
   @total=0.0
    bill.item.price.each do |price|
      @total += price
    end
 end

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
    @bill.price = @bill.total
    if @bill.save
      redirect root_path
    else
      render 'new'
    end
  end 
  
  def delete
    @bill = Bill.find(params[:id])
    @bill.destroy
    redirect_to root_path
  end

 private
  def bill_params
    params.require(:bill).permit(:date, :facility_id, :procedure_id, items_attributes:[:name, :description, :price, :id, :_destroy])
  end 
end
