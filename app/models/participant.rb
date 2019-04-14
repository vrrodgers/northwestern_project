class Participant < ApplicationRecord
    has_many :registries
    has_many :enrollments
end
