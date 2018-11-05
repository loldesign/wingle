class CandidateProcessSelection < ApplicationRecord
  include AASM

  belongs_to :candidate
  belongs_to :process_selection

  aasm :column => :state, :logger => Rails.logger do
    state :selected, initial: true
    state :first_level, :second_level, :third_level, :received_proposal, :accepted_proposal

    event :to_first_level do
      transitions from: :selected, to: :first_level
    end

    event :to_second_level do
      transitions from: :first_level, to: :second_level
    end

    event :to_third_level do
      transitions from: :second_level, to: :third_level
    end

    event :send_proposal do
      transitions from: :third_level, to: :received_proposal
    end

    event :approve_proposal do
      transitions from: :received_proposal, to: :accepted_proposal
    end
  end
end
