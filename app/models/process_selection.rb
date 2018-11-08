class ProcessSelection < ApplicationRecord
  include AASM

  belongs_to :owner, polymorphic: true
  belongs_to :company
  has_many :candidate_process_selections
  has_many :candidates, through: :candidate_process_selections

  belongs_to :area          , optional: true
  belongs_to :function      , optional: true
  belongs_to :title_list    , optional: true
  belongs_to :education_list, optional: true
  belongs_to :language_list , optional: true

  aasm :column => :state, :logger => Rails.logger do
    state :setting, initial: true
    state :started, :historic

    event :start do
      transitions from: :setting, to: :started
    end

    event :history, after: :create_new_process do
      transitions from: :started, to: :historic
    end
  end

  private
  def create_new_process
    ProcessSelectionManager::Create.new(company: self.company, owner: self.owner).process
  end
end
