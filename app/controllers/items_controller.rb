class ItemsController < ApplicationController
    def index
        @items=Item.all
    end
    
    def show
        @item=Item.find(params[:id])
    end
    
    def new
        @item=Item.new
        @facilities=Facility.all
    end
    
    def create
        @item=Item.new
        @item.name=params[:item][:name].upcase
        @item.date=params[:item][:date]
        @item.description=params[:item][:description]
        @item.price=params[:item][:price]
        @item.status=params[:item][:status]
        @item.facility_id=params[:facility_id]
        @item.status="pending"
        @item.save
        redirect_to items_path
    end
    
end
