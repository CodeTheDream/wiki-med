class FacilitiesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :base_params, :create_params, :update_params]
  def index
    @facilities = Facility.all
  end
    
  def new
    @facility = Facility.new
  end
    
  def create
    @facility = Facility.create(create_params)
    @facility.save
  redirect_to "/"
      
  end
    
  def edit
    @facility = Facility.find(params[:id])
  end
    
  def update
    @facility = Facility.find(params[:id])
    @facility.update(update_params)
    @facility.save
    redirect_to "/admins"
  end
    
  def show
  end
    
  def destroy
    facility = Facility.find(params[:id])
    facility.destroy
    redirect_to "/admins"
  end
  
  private
  
  def base_params
    params.require(:facility)
  end
  
  def create_params
    base_params.permit(:name, :city, :state, :zip, :specialty)
  end
  
  def update_params
    base_params.permit(:name, :city, :state, :zip, :specialty)
  end
end
