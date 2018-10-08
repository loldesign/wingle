class Term < ApplicationRecord
  include AASM
  extend Enumerize
  extend ActiveModel::Naming

  has_many   :terms,  class_name: 'Term', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Term', foreign_key: 'parent_id', optional: true

  enumerize :for, in: [:candidate, :company], scope: true

  aasm :column => 'state' do
    state :draft, :initial => true
    state :published, :archived

    event :publish do
      transitions :from => :draft, :to => :published
    end

    event :archive do
      transitions :from => :published, :to => :archived
    end
  end

end
