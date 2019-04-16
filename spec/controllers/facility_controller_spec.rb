require 'rails_helper'

RSpec.describe FacilitiesController, type: :controller do

  context 'when user is not logged in' do
    setup do 
      user = User.create()
      allow(controller).to receive(:authenticate_user!).and_return(false)
      allow(controller).to receive(:current_user).and_return(user)	
    end	      
    
    # test to create a facility
    it 'should create a facility'do  
      post :create, params: { facility: {
        name: 'Office',
       	street: '101 Anystreet',
       	city: 'Someplace',
       	state: 'NC',
       	zip: '22222',
       	specialty: 'general'}}
      facility = Facility.first
      expect(facility.name).to eq('Office')
    end
  end

  context 'when user is logged in' do
    setup do
      user = User.create()
      allow(controller).to receive(:authenticate_user!).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)
    end

    # test to create a facility
    it 'should create a facility'do
      post :create, params: { facility: {
        name: 'Office',
       	street: '101 Anystreet',
       	city: 'Someplace',
       	state: 'NC',
       	zip: '22222',
       	specialty: 'general'}}
      facility = Facility.first
      expect(facility.name).to eq('Office')
    end
  end

  context 'when user is logged in' do
      setup do
        user = User.create()
        allow(controller).to receive(:authenticate_user!).and_return(true)
        allow(controller).to receive(:current_user).and_return(user)   
      end

    it 'should update a facility', js: true do
      # test to update a facility
      facility = Facility.create(
        name: 'Office',
        street: '101 Anystreet',
        city: 'Someplace',
        state: 'NC',
        zip: '22222',
        specialty: 'general'      
      )
    
      facility_params = {
	name: 'Dr. Office',
        street: '101 Anystreet',
        city: 'Someplace',
        state: 'NC',
        zip: '22222',
        specialty: 'general'      
      } 

      put :update, params: {facility: facility_params, id: facility.id}

      facility.reload

      expect(facility.name).to eq("Dr. Office")

    end
  end
end
