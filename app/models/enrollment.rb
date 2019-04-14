class Enrollment < ApplicationRecord
    belongs_to :participant
    belongs_to :registry
    belongs_to :contact_method
    belongs_to :coordinator
    enum status: {created: 0, pending_review: 1, approved: 2, denied: 3}
   
    scope :search, -> {
        joins(:participant)
        .select('enrollments.coordinator_id, COUNT(participants.gender), participants.gender')
        .group('enrollments.coordinator_id, participants.gender')
    }

    def participant_name
        participant.try(:name)
    end

    def participant_name=(name)
        self.participant = Participant.find_or_create_by(name: name) if name.present?
    end


    
end
