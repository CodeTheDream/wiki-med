class FacilitiesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  def index
    @facilities = Facility.all
  end
    
  def new
    @facility = Facility.new
  end
    
  def create
    @facility = Facility.create(facilities_params)
    redirect_to root_url
  end
    
  def edit
    @facility = Facility.find(params[:id])
  end
    
  def update
    @facility = Facility.find(params[:id])
    @facility.update(facilities_params)
    redirect_to admins_url
  end
    
  def show
  end
    
  def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy
    redirect_to admins_url
  end
  
  private
  
  def facilities_params
    params.require(:facility).permit(:name, :street, :city, :state, :zip, :specialty)
  end

end
