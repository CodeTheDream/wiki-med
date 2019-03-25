class ProceduresController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :base_params, :create_params, :update_params]
  #Currently shows all pending Procedures
  def index
    @procedures = Procedure.where("status = 'approved'")
  end
    
  #Creates a new Procedure
  def new
    @procedure = Procedure.new
  end

  #adds new procedure to database
  def create
    @procedure = Procedure.create(create_params)
    @procedure.status = "pending"
    @procedure.save
    redirect_to "/"
  end

  #edit exisiting database entry -- only available to admin -------
  def edit
    @procedure = Procedure.find(params[:id])
  end

  #update exisiting database entry -- only available to admin -------
  def update
    @procedure = Procedure.find(params[:id])
    @procedure.update(update_params)
    @procedure.status = 'pending'
    @procedure.save
    redirect_to "/admins"
  end

  def show
  end

  #destroy database entry
  def destroy
    procedure = Procedure.find(params[:id])
    procedure.destroy
    redirect_to "/admins"
  end
  
  private
  
  def base_params
    params.require(:procedure)
  end
  
  def create_params
    base_params.permit(:name, :date, :description, :price, :facility_id)
  end
  
  def update_params
    base_params.permit(:name, :date, :description, :price, :facility_id)
  end
  
end
