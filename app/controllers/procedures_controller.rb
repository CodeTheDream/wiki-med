class ProceduresController < ApplicationController
     #Currently shows all Procedures
    def index
        @procedures = Procedure.all
    end
    
    #Creates a new Procedure
    def new
        @procedure = Procedure.new
        @facilities = Facility.all
    end

    #adds new procedure to database
    def create
        procedure = Procedure.new
        procedure.name = params[:procedure][:name]
        procedure.date = params[:procedure][:date]
        procedure.description = params[:procedure][:description]
        procedure.price = params[:procedure][:price]
        procedure.facility_id = params[:procedure][:facility_id]
        procedure.status = "pending"
        procedure.save
        redirect_to "/"
    end

    #edit exisiting database entry -- only available to admin? -------
    def edit
        @procedure = Procedure.find(params[:id])
        @facilities = Facility.all
    end

    #update exisiting database entry -- only available to admin? -------
    def update
        procedure = Procedure.new
        procedure.name = params[:procedure][:name]
        procedure.date = params[:procedure][:date]
        procedure.description = params[:procedure][:description]
        procedure.price = params[:procedure][:price]
        procedure.facility_id = params[:procedure][:facility_id]
        procedure.status = params[:status] #drop down?
        procedure.save
        redirect_to "/"
    end

    def show
    end

    def procedure_params
        params.require(:procedure).permit(:name, :date, :description, :price)
    end

    #destroy database entry
    def destroy
        procedure = Procedure.find(params[:id])
        procedure.destroy
        redirect_to "/"
    end
end
