class ProcessSelection < ApplicationRecord
  include AASM

  belongs_to :owner, polymorphic: true
  belongs_to :company

  aasm :column => :state, :logger => Rails.logger do
    state :setting, initial: true
    state :started, :completed, :canceled

    event :start do
      transitions from: :setting, to: :started
    end

    event :complete, after: :create_new_process do
      transitions from: :started, to: :completed
    end

    event :cancel do
      transitions from: [:started, :completed], to: :canceled
    end
  end

  private
  def create_new_process
    ProcessSelectionManager::Create.new(company: self.company, owner: self.owner).process
  end
end
