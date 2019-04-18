require 'rails_helper'

RSpec.describe FacilitiesController, type: :controller do

  context 'when user is not logged in' do
    setup do 
    end	      
    
    fac_params = { facility: {
                     name: 'Office',
                     street: '101 Anystreet',
                     city: 'Someplace',
                     state: 'NC',
                     zip: '22222',
                     specialty: 'general'}}

    
    # test to create a facility
    it 'should create a facility' do  
      post :create, params: fac_params
      facility = Facility.first
      expect(facility.name).to eq('Office')
    end
  end

  context 'when user is logged in' do
    setup do
      user = FactoryBot.create :user
      sign_in(user)
    end

    fac_params = { facility: {
                     name: 'Office',
                     street: '101 Anystreet',
                     city: 'Someplace',
                     state: 'NC',
                     zip: '22222',
                     specialty: 'general'}}

    # test to create a facility
    it 'should create a facility' do
      post :create, params: fac_params
      facility = Facility.first
      expect(facility.name).to eq('Office')
    end
  end

  context 'when user is logged in' do
      setup do
        user = FactoryBot.create :user
        sign_in(user)	      
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
