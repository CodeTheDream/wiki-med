class AdminsController < ApplicationController
    before_action :authenticate_user!
    
    def index
      @items=Item.where("status = 'pending'")
      @procedures=Procedure.where("status = 'pending'")
      @user=current_user
    end

    def approve
        @item=Item.find(params[:id])
        @item.status="approved"
        @item.save
        redirect_to admins_path
    end
    
    def approve_p
        @procedure=Procedure.find(params[:id])
        @procedure.status="approved"
        @procedure.save
        redirect_to admins_path
    end

    def edit 
        @item=Item.find(params[:id])
    end
    
    def edit_p
        @procedure=Item.find(params[:id])
    end
    
    def update
        @item=Item.find(params[:id])
        @item.name=params[:item][:name]
        @item.date=params[:item][:date]
        @item.description=params[:item][:description]
        @item.price=params[:item][:price]
        @item.status=params[:item][:status]
        @item.facility_id=params[:facility_id]
        @item.save
        redirect_to admins_path
    end
    
    def update_p
        @procedure=Procedure.find(params[:id])
        @procedure.name=params[:procedure][:name]
        @procedure.date=params[:procedure][:date]
        @procedure.description=params[:procedure][:description]
        @procedure.price=params[:procedure][:price]
        @procedure.status=params[:procedure][:status]
        @procedure.facility_id=params[:facility_id]
        @procedure.save
        redirect_to admins_path
    end
    
    def delete
        item=Item.find(params[:id])
        item.destroy
        redirect_to admins_path
    end
    
    def delete_p
        procedure=Procedure.find(params[:id])
        procedure.destroy
        redirect_to admins_path
    end
    
    def show_items
      @items = Item.all
    end
    
    def show_procedures
      @procedures = Procedure.all
    end
    
    def show_facilities
      @facilities = Facility.all
    end
end
