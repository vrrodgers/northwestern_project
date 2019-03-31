class Registry < ApplicationRecord
    has_many :enrollments
    has_many :participants , through: :enrollments
    has_many :coordinator_registries
    has_many :coordinator, through: :coordinator_registries

    enum status: {open: 0, closed: 1}
end
