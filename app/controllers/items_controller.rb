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
    
    #edit exisiting database entry -- only available to admin
    def edit
        @item = Item.find(params[:id])
        @facilities = Facility.all
    end
    
    #update exisiting database entry -- only available to admin
    def update
        item = Item.find(params[:id])
        item.name = params[:item][:name]
        item.date = params[:item][:date]
        item.description = params[:item][:description]
        item.price = params[:item][:price]
        item.facility_id = params[:facility_id]
        item.status = 'pending'
        item.save
        redirect_to "/admins"
    end
    
    #destroy database entry 
    def destroy
        item = Item.find(params[:id])
        item.destroy
        redirect_to "/admins"
    end
    
end
