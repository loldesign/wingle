class ProcessSelection < ApplicationRecord
  include AASM

  belongs_to :owner, polymorphic: true
  belongs_to :company
  has_many :candidate_process_selections
  has_many :candidates, through: :candidate_process_selections

  belongs_to :area
  belongs_to :function
  belongs_to :title_list
  belongs_to :title_list
  belongs_to :education_list
  belongs_to :language_list

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
