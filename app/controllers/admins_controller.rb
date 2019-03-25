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
