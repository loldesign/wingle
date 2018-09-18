class CandidateExperience < ApplicationRecord
  belongs_to :candidate

  serialize :functions_time_exp, Array
end