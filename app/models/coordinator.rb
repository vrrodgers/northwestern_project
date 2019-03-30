class Coordinator < ApplicationRecord
    has_many :coordinator_registries
    has_many :registries, through: :coordinator_registries
end
