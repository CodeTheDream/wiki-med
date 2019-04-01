class ProceduresController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  #Currently shows all pending Procedures
  def index
    @procedures = Procedure.all
  end
    
  #Creates a new Procedure
  def new
    @procedure = Procedure.new
  end

  #adds new procedure to database
  def create
    @procedure = Procedure.create(procedures_params)
    redirect_to root_url
  end

  #edit exisiting database entry -- only available to admin -------
  def edit
    @procedure = Procedure.find(params[:id])
  end

  #update exisiting database entry -- only available to admin -------
  def update
    @procedure = Procedure.find(params[:id])
    @procedure.update(procedures_params)
    redirect_to admins_url
  end

  def show
  end

  #destroy database entry
  def destroy
    @procedure = Procedure.find(params[:id])
    @procedure.destroy
    redirect_to admins_url
  end
  
  private
  
  def procedures_params
    params.require(:procedure).permit(:name, :description)
  end  
end
