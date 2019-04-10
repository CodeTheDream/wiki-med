class FacilitiesController < ApplicationController
  # ensures admin is logged in before edit, update and destroy are permitted
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  
  # creates an instance variable to pass all facilities into view
  def index
    @facilities = Facility.all
  end
  
  # creates an instance variable to pass into new form  
  def new
    @facility = Facility.new
  end
    
  # creates a new facility from strong params and redirects to root or admin page if logged in.
  def create
    @facility = Facility.create(facilities_params)
    if (user_signed_in?)
      redirect_to admins_url
    else 
      redirect_to root_url
    end
  end
    
  # creates an instance variable for an existing facility to edit
  # available only to admins
  def edit
    @facility = Facility.find(params[:id])
  end
  
  # updates an existing facility and redirects to admin path  
  def update
    @facility = Facility.find(params[:id])
    @facility.update(facilities_params)
    redirect_to admins_url
  end
    
  def show
  end
  
  # deletes an existing facility -- only available to admins  
  def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy
    redirect_to admins_url
  end
  
  private
  
  # only accepts params in the format {facility => [:name, :street, :city, :state, :zip, :specialty]}
  def facilities_params
    params.require(:facility).permit(:name, :street, :city, :state, :zip, :specialty)
  end

end
