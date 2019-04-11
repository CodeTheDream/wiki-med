class ProceduresController < ApplicationController
  # restricts access to new, create, update, edit and destroy to admins
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  #Currently shows all Procedures
  def index
    @procedures = Procedure.all
  end
    
  #Creates a new Procedure -- only available to admin
  def new
    @procedure = Procedure.new
  end

  #adds new procedure to database -- only available to admin
  def create
    @procedure = Procedure.create(procedures_params)
    redirect_to admins_url
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

  # passes a single procedure to the show view
  def show
    @procedure = Procedure.find(params[:id])
    @bills = Bill.all
  end

  #destroy database entry -- only available to admin
  def destroy
    @procedure = Procedure.find(params[:id])
    @procedure.destroy
    redirect_to admins_url
  end
  
  private
  
  # limits what parameters are allowed to be passed in
  def procedures_params
    params.require(:procedure).permit(:name, :description)
  end  
end
