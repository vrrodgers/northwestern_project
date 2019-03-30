class Registry < ApplicationRecord
    has_many :participants
    has_many :participants , through: :enrollment

end
