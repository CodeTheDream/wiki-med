class ProcedureInstance < ApplicationRecord
    belongs_to :procedure
    belongs_to :facility
end
