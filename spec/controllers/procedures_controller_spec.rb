require 'rails_helper'

RSpec.describe ProceduresController, type: :controller do

  context 'when user is logged in' do
    setup do
      user = User.create()
      allow(controller).to receive(:authenticate_user!).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)  
    end
    
    # test to create a procedure
    it 'should create a procedure' do
      post :create, params: { procedure: {
        name: 'Exam',
        description: 'Dr looks at you'
      }}
      procedure = Procedure.first
      expect(procedure.name).to eq('Exam')
    end

    # test to update a procedure 
    it 'should update a procedure', js: true do
        procedure = Procedure.create(
        name: 'Exam',
	description: 'Dr. looks at you'
      )

      procedure_params = {
        name: 'Examination',
	description: 'Dr. looks at you'
      }

      put :update, params: {procedure: procedure_params, id: procedure.id}

      procedure.reload

      expect(procedure.name).to eq("Examination")
    end
  end
end
