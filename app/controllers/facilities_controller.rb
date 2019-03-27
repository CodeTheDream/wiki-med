class FacilitiesController < ApplicationController
    def index
        @facilities = Facility.all
    end
    
    def new
        @facility = Facility.new
    end
    
    def create
        facility = Facility.new
        facility.name = params[:facility][:name]
        facility.city = params[:facility][:city]
        facility.state = params[:facility][:state]
        facility.zip = params[:facility][:zip]
        facility.specialty = params[:facility][:specialty]
        facility.save
        redirect_to "/"
        
    end
    
    def edit
        @facility = Facility.find(params[:id])
    end
    
    def update
        facility = Facility.find(params[:id])
        facility.name = params[:facility][:name]
        facility.city = params[:facility][:city]
        facility.state = params[:facility][:state]
        facility.zip = params[:facility][:zip]
        facility.specialty = params[:facility][:specialty]
        facility.save
        redirect_to "/"
    end
    
    def show
    end
    
    def destroy
        facility = Facility.find(params[:id])
        facility.destroy
        redirect_to "/"
        
    end
end
