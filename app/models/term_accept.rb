class TermAccept < ApplicationRecord
  belongs_to :term
  belongs_to :acceptable, polymorphic: true
end
