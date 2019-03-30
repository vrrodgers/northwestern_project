class Enrollment < ApplicationRecord
    belongs_to :participant
    belongs_to :registry
    belongs_to :contact_method
end
